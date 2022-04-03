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
-- vendor weapons
	devastator=0xb,
	visibomb=0xd,
	taunter=0xe,
	blaster=0xf,
	pyrociter=0x10,
	mine_glove=0x11,
	walloper=0x12,
	tesla_claw=0x13,
	glove_of_doom=0x14,
	drone_device=0x18,
	decoy_glove=0x19,
-- check weapons
	bomb_glove=10,
	--suck_cannon=,
	morph_o_ray=0x15,
	--ryno=,

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

-- explosive weapons: bomb glove, devastator, visibomb, ryno

local strats = {
	-- VELDIN 1
	novalis={
		casual={},
	},
	bomb_glove={
		casual={},
	},

	-- NOVALIS
	aridia={
		casual={},
	},
	kerwan={
		casual={},
	},
	pyrociter={
		casual={},
	},

	-- ARIDIA
	sonic_summoner={
		casual={id.zoomerator},
	},
	trespasser={
		casual={id.swingshot},
		ilj={id.heli_pack},
		sinaflip={id.heli_pack},
		isf={id.thruster_pack},
	},
	hoverboard={
		casual={},
	},

	-- KERWAN
	eudora={
		casual_heli={id.heli_pack},
        casual_thruster={id.thruster_pack},
		packless={},
	},
	heli_pack={
		casual={},
	},
	swingshot={
		casual={},
	},
	blaster={
		casual={},
	},

	-- EUDORA
	blarg={
		casual_heli={id.heli_pack, id.swingshot, id.trespasser},
        casual_thruster={id.thruster_pack, id.swingshot, id.trespasser},
		packless={},
		skip_heli={id.heli_pack},
		skip_thruster={id.thruster_pack},
		decoy={id.decoy_glove},
	},
	glove_of_doom={
		casual={},
	},
	suck_cannon={
		casual_heli={id.heli_pack},
		casual_thruster={id.thruster_pack},
	},

	-- RILGAR
	umbris={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer},
		packless={},
		sinaflip={id.heli_pack},
		ilj={id.heli_pack},
		isf={id.thruster_pack},
	},
	zoomerator={
		casual_heli={id.heli_pack, id.hoverboard},
        casual_thruster={id.thruster_pack, id.hoverboard},
		packless_hoverboard={id.hoverboard},
		packless_clip={id.decoy_glove},
	},
	mine_glove={
		casual={},
	},
	ryno={
		casual={id.metal_detector},
	},

	-- BLARG
	rilgar={
		casual={},
	},
	hydrodisplacer={
		casual={id.trespasser},
		skip_heli = {id.heli_pack},
		skip_thruster = {id.thruster_pack},
		decoy={id.decoy_glove},
	},
	grindboots={
		casual={id.swingshot},
	},
	taunter={
		casual={},
	},

	-- UMBRIS
	batalia={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer},
		packless={id.swingshot},
		ilj={id.heli_pack},
		sinaflip={id.heli_pack},
		isf={id.thruster_pack},
	},

	-- BATALIA
	gaspar={
		casual={id.grindboots},
		si_heli={id.heli_pack},
	},
	orxon={
		casual={},
	},
	metal_detector={
		casual={id.magneboots},
		gpc={id.thruster_pack},
		tplj={id.thruster_pack},
		skip_heli={id.heli_pack},
		skip_thruster={id.thruster_pack},
	},
	devastator={
		casual={},
	},

	-- GASPAR
	pilots_helmet={
		casual={},
	},
	walloper={
		casual={},
	},

	-- ORXON
	pokitaru={
		casual={},
	},
	hoven={
		casual_heli={id.heli_pack, id.o2_mask, id.swingshot, id.magneboots},
        casual_thruster={id.thruster_pack, id.o2_mask, id.swingshot, id.magneboots},
		magnewalk_heli={id.heli_pack, id.o2_mask, id.magneboots},
		magnewalk_thruster={id.thruster_pack, id.o2_mask, id.magneboots},
		packless={id.decoy_glove, id.swingshot, id.magneboots},
	},
	magneboots={
		casual={},
	},
	premium_nanotech={
		casual_heli={id.heli_pack, id.o2_mask},
		casual_thruster={id.thruster_pack, id.o2_mask},
		clank_clip={},
		decoy={id.decoy_glove},
	},
	ultra_nanotech={
		casual_heli={id.heli_pack, id.o2_mask, id.premium_nanotech},
		casual_thruster={id.thruster_pack, id.o2_mask, id.premium_nanotech},
		clank_clip={id.premium_nanotech},
		decoy={id.decoy_glove},
	},
	visibomb={
		casual={},
	},

	-- POKITARU
	thruster_pack={
		casual={},
	},
	o2_mask={
		casual={id.thruster_pack, id.pilots_helmet},
		decoy={id.decoy_glove, id.pilots_helmet},
	},
	persuader={
		casual={id.hydrodisplacer, id.trespasser, id.raritanium},
		skip_hydro={id.hydro_pack, id.o2_mask, id.raritanium},
		decoy={id.decoy_glove, id.trespasser, id.raritanium},
	},
	decoy_glove={
		casual={},
	},

	-- HOVEN
	gemlik={
		casual={},
	},
	hydro_pack={
		casual={id.hydrodisplacer},
		sinaflip={id.heli_pack},
		ilj={id.heli_pack},
		isf={id.thruster_pack},
	},
	raritanium={
		casual_heli={id.heli_pack, id.swingshot},
		casual_thruster={id.thruster_pack, id.swingshot},
		sinaflip={id.heli_pack},
		ilj={id.heli_pack},
		isf={id.thruster_pack},
	},
	drone_device={
		casual={},
	},

	-- GEMLIK
	oltanis={
		casual={id.swingshot, id.trespasser, id.magneboots}, -- visibomb
		skip_thruster={id.thruster_pack},
		decoy={id.decoy_glove, id.swingshot, id.magneboots},
	},

	-- OLTANIS
	quartu={
		casual={id.grindboots},
		magnewalk={id.magneboots},
	},
	pda={
		casual={id.magneboots},
	},
	tesla_claw={
		casual={},
	},
	morph_o_ray={
		casual={id.swingshot},
	},

	-- QUARTU
	kalebo={
		casual={id.swingshot},
		nlj={id.heli_pack},
		tplj={id.thruster_pack},
	},
	fleet={
		casual={id.thruster_pack, id.swingshot, id.hologuise},
		decoy_heli={id.heli_pack, id.decoy_glove},
		decoy_thruster={id.thruster_pack, id.decoy_glove},
	},
	bolt_grabber={
		casual={id.hydro_pack, id.o2_mask},
		si_heli={id.heli_pack},
	},

	-- KALEBO
	hologuise={
		casual_heli={id.heli_pack, id.swingshot, id.grindboots, id.hoverboard},
        casual_thruster={id.thruster_pack, id.swingshot, id.grindboots, id.hoverboard},
		skip_heli={id.heli_pack, id.hoverboard},
		skip_thruster={id.heli_pack, id.hoverboard},
		decoy={id.decoy_glove, id.hoverboard},
	},
	map_o_matic={
		casual={id.grindboots},
	},

	-- FLEET
	veldin={
		casual={id.magneboots, id.hologuise},
		skip_hololess={id.magneboots}, -- explosives needed
		decoy={id.decoy_glove},
	},
	codebot={
		casual={id.hydro_pack, id.o2_mask},
		skip_clip={},
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


-- this is where a settings menu would toggle values inside 'locations'
local settings = {standard='casual', speedtech=''}
ActivateCategory(settings.standard, true)


-- converts to main.lua's table format
function ApplyReqs(local_table, id_type)
	for check in ipairs(local_table) do			-- this empties all req_items fields
		local_table[check].req_items = {}
	end

	for check in ipairs(local_table) do			-- this fills all req_items fields from 'strats' according to 'locations'
		for location,_ in pairs(locations) do
			if local_table[check].id == id_type[location] then
				for option,status in pairs(locations[location]) do
					if status then
						table.insert(local_table[check].req_items, strats[location][option])
					end
				end
			end
		end
	end

	return local_table
end

-- testing
local items = {
	{id=2, name="Heli-pack", req_items={} },
	{id=3, name="Thruster-pack", req_items={} },
	{id=4, name="Hydro-pack", req_items={{0x16}, {2}} },
	{id=5, name="Sonic Summoner", req_items={{0x30}} },
	{id=6, name="O2 Mask", req_items={{7}} },
	{id=7, name="Pilot's Helmet", req_items={} },
	{id=0xc, name="Swingshot", req_items={} },
	{id=0x16, name="Hydrodisplacer", req_items={{0x1a}, {2}, {3}} },
	{id=0x1a, name="Trespasser", req_items={{0xc}, {2}, {3}} },
	{id=0x1b, name="MetalDetector", req_items={{0x1c}, {2}, {3}} },
	{id=0x1c, name="Magneboots", req_items={} },
	{id=0x1d, name="Grindboots", req_items={{0xc}, {2}, {3}} },
	{id=0x1e, name="Hoverboard", req_items={} },
	{id=0x1f, name="Hologuise", req_items={{0x1e}} },
	{id=0x20, name="PDA", req_items={{0x1c}} },
	{id=0x21, name="Map-O-Matic", req_items={{0x1d}} },
	{id=0x22, name="Bolt Grabber", req_items={{4, 6}} },
	{id=0x23, name="Persuader", req_items={{0x1a, 0x31}} },
	{id=0x30, name="Zoomerator", req_items={{0x1e, 0x2}, {0x1e, 0x3}} },
	{id=0x31, name="Raritanium", req_items={{0xc}, {3}, {2}} },
	{id=0x32, name="Codebot", req_items={} },
	{id=0x34, name="Premium Nanotech", req_items={{6, 2}, {6, 3}} },
	{id=0x35, name="Ultra Nanotech", req_items={{6, 3, 0x34}, {6, 2, 0x34}} },
}

local infobots = {
	{id=1, req_items={} },  						-- Novalis "infobot" on Veldin1
	{id=2, req_items={} },  						-- Aridia infobot on Novalis
	{id=3, req_items={} },  						-- Kerwan infobot on Novalis 
	{id=4, req_items={{2}, {3}} }, 					-- Eudora infobot on Kerwan
	{id=5, req_items={} },							-- Rilgar infobot on Blarg
	{id=6, req_items={{2}, {3}} },  				-- Blarg infobot on Eudora
	{id=7, req_items={{0xc}, {2}, {3}} },			-- Umbris infobot on Rilgar
	{id=8, req_items={{0xc}, {2}} },				-- Batalia infobot on Umbris
	{id=9, req_items={{0x1d}, {2}} },				-- Gaspar infobot on Batalia
	{id=10, req_items={} },							-- Orxon infobot on Batalia
	{id=0xb, req_items={} },						-- Pokitaru infobot on Orxon
	{id=0xc, req_items={{6, 2}, {6, 3}} },			-- Hoven infobot on Orxon
	{id=0xd, req_items={} },						-- Gemlik infobot on Hoven
	{id=0xe, req_items={{0xc, 0x1c, 0x1a}, {3}} }, 	-- Oltanis infobot on Gemlik
	{id=0xf, req_items={{0x1c}} },					-- Quartu infobot on Oltanis
	{id=0x10, req_items={{2}, {3}, {0xc}} },		-- KaleboIII infobot on Quartu
	{id=0x11, req_items={{3, 0xc}} },				-- Fleet infobot on Quartu
	{id=0x12, req_items={{3}, {0x1c, 0x1f}} }		-- Veldin2 infobot on Fleet
}


items = ApplyReqs(items, id)
infobots = ApplyReqs(infobots, idb)


--test
print('ITEMS')
PrintTable(items)
print('INFOBOTS')
PrintTable(infobots)
print('Done!')
-- hey, it prints!
-- still breaks racman, though