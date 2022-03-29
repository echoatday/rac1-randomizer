require 'deepcopy'
require 'printtable'

-- key item ids
local id = {
	heli_pack=2,
	thruster_pack=3,
	hydro_pack=4,
	sonic_summoner=5,
	o2_mask=6,
	pilots_helmet=7,
	swingshot=0xc,
	hydrodisplacer=0x16,
	trespasser=0x1a,
	metal_detector=0x1b,
	magneboots=0x1c,
	grindboots=0x1d,
	hoverboard=0x1e,
	hologuise=0x1f,
	pda=0x20,
	map_o_matic=0x21,
	bolt_grabber=0x22,
	persuader=0x23,
	zoomerator=0x30,
	raritanium=0x31,
	codebot=0x32,
	premium_nanotech=0x34,
	ultra_nanotech=0x35,
}
-- infobot ids
local idb = {
	novalis=1,
	aridia=2,
	kerwan=3,
	eudora=4,
	rilgar=5,
	blarg=6,
	umbris=7,
	batalia=8,
	gaspar=9,
	orxon=10,
	pokitaru=0xb,
	hoven=0xc,
	gemlik=0xd,
	oltanis=0xe,
	quartu=0xf,
	kalebo=0x10,
	fleet=0x11,
	veldin=0x12,
}

local strats = {
	-- VELDIN 1
	novalis={
		casual={}
	},

	-- NOVALIS
	aridia={
		casual={}
	},
	kerwan={
		casual={}
	},

	-- ARIDIA
	sonic_summoner={
		casual={}
	},
	trespasser={
		casual={id.swingshot}
	},
	hoverboard={
		casual={}
	},

	-- KERWAN
	eudora={
		casual_heli={id.heli_pack},
        casual_thruster={id.thruster_pack}
	},
	heli_pack={
		casual={}
	},
	swingshot={
		casual={}
	},

	-- EUDORA
	blarg={
		casual_heli={id.heli_pack, id.swingshot, id.trespasser},
        casual_thruster={id.thruster_pack, id.swingshot, id.trespasser}
	},

	-- RILGAR
	umbris={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer}
	},
	zoomerator={
		casual_heli={id.heli_pack},
        casual_thruster={id.thruster_pack}
	},

	-- BLARG
	rilgar={
		casual={}
	},
	hydrodisplacer={
		casual={id.trespasser}
	},
	grindboots={
		casual={id.swingshot}
	},

	-- UMBRIS
	batalia={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer}
	},

	-- BATALIA
	gaspar={
		casual={id.grindboots}
	},
	orxon={
		casual={}
	},
	metal_detector={
		casual={id.magneboots}
	},

	-- GASPAR
	pilots_helmet={
		casual={}
	},

	-- ORXON
	pokitaru={
		casual={}
	},
	hoven={
		casual_heli={id.heli_pack, id.swingshot, id.magneboots},
        casual_thruster={id.thruster_pack, id.swingshot, id.magneboots}
	},
	magneboots={
		casual={}
	},
	premium_nanotech={
		casual={id.o2_mask}
	},
	ultra_nanotech={
		casual={id.o2_mask}
	},

	-- POKITARU
	thruster_pack={
		casual={}
	},
	o2_mask={
		casual={id.thruster_pack, id.pilots_helmet}
	},
	persuader={
		casual={id.hydrodisplacer, id.trespasser, id.raritanium}
	},

	-- HOVEN
	gemlik={
		casual={}
	},
	hydro_pack={
		casual={id.hydrodisplacer}
	},
	raritanium={
		casual={id.swingshot}
	},

	-- GEMLIK
	oltanis={
		casual={id.swingshot, id.trespasser, id.magneboots}
	},

	-- OLTANIS
	quartu={
		casual={id.grindboots}
	},
	pda={
		casual={id.magneboots}
	},

	-- QUARTU
	kalebo={
		casual={id.swingshot}
	},
	fleet={
		casual={id.thruster_pack, id.swingshot, id.hologuise}
	},
	bolt_grabber={
		casual={id.hydro_pack, id.o2_mask}
	},

	-- KALEBO
	hologuise={
		casual_heli={id.heli_pack, id.swingshot, id.grindboots, id.hoverboard},
        casual_thruster={id.thruster_pack, id.swingshot, id.grindboots, id.hoverboard}
	},
	map_o_matic={
		casual={id.grindboots}
	},

	-- FLEET
	veldin={
		casual={id.magneboots, id.hologuise}
	},
	codebot={
		casual={id.hydro_pack, id.o2_mask}
	},

}

-- build the locations table
local locations = {}
for location,_ in pairs(strats) do					-- for each location in strats table
	locations[location] = {}						-- add that place to the locations table!
	for strat,_ in pairs(strats[location]) do		-- then, for each strat in the strats table,
		locations[location][strat] = false			-- put it into locations as a deactivated bool.
	end
end

-- toggle an entire category of strats
function ActivateCategory(category, new_status)
	for location,_ in pairs(locations) do							-- for each key location,
		for strat,_ in pairs(locations[location]) do				-- check its strats.
			if strat:find(category) then							-- if the strat is within the selected category,
				locations[location][strat] = new_status				-- 'toggle' it.
			end
		end
	end
end

-- turn on selected strats
local settings = {standard='casual', speedtech=''}
ActivateCategory(settings.standard, true)


PrintTable(locations) -- for testing

print('Done!')