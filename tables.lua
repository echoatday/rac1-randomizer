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

local tech = {
	-- ITEMS --
	heli_pack={
		casual={}
	},
	thruster_pack={
		casual={}
	},
	hydro_pack={
		casual={id.hydrodisplacer}
	},
	sonic_summoner={
		casual={}
	},
	o2_mask={
		casual={id.thruster_pack, id.pilots_helmet}
	},
	pilots_helmet={
		casual={}
	},
	swingshot={
		casual={}
	},
	hydrodisplacer={
		casual={id.trespasser}
	},
	trespasser={
		casual={id.swingshot}
	},
	metal_detector={
		casual={id.magneboots}
	},
	magneboots={
		casual={}
	},
	grindboots={
		casual={id.swingshot}
	},
	hoverboard={
		casual={}
	},
	hologuise={
		casual_heli={id.heli_pack, id.swingshot, id.grindboots, id.hoverboard},
        casual_thruster={id.thruster_pack, id.swingshot, id.grindboots, id.hoverboard}
	},
	pda={
		casual={id.magneboots}
	},
	map_o_matic={
		casual={id.grindboots}
	},
	bolt_grabber={
		casual={id.hydro_pack, id.o2_mask}
	},
	persuader={
		casual={id.hydrodisplacer, id.trespasser, id.raritanium}
	},
	zoomerator={
		casual_heli={id.heli_pack},
        casual_thruster={id.thruster_pack}
	},
	raritanium={
		casual={id.swingshot}
	},
	codebot={
		casual={id.hydro_pack, id.o2_mask}
	},
	premium_nanotech={
		casual={id.o2_mask}
	},
	ultra_nanotech={
		casual={id.o2_mask}
	},
	-- INFOBOTS --
	novalis={
		casual={}
	},
	aridia={
		casual={}
	},
	kerwan={
		casual={}
	},
	eudora={
		casual_heli={id.heli_pack},
        casual_thruster={id.thruster_pack}
	},
	rilgar={
		casual={}
	},
	blarg={
		casual_heli={id.heli_pack, id.swingshot, id.trespasser},
        casual_thruster={id.thruster_pack, id.swingshot, id.trespasser}
	},
	umbris={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer}
	},
	batalia={
		casual_heli={id.heli_pack, id.swingshot, id.hydrodisplacer},
        casual_thruster={id.thruster_pack, id.swingshot, id.hydrodisplacer}
	},
	gaspar={
		casual={id.grindboots}
	},
	orxon={
		casual={}
	},
	pokitaru={
		casual={}
	},
	hoven={
		casual_heli={id.heli_pack, id.swingshot, id.magneboots},
        casual_thruster={id.thruster_pack, id.swingshot, id.magneboots}
	},
	gemlik={
		casual={}
	},
	oltanis={
		casual={id.swingshot, id.trespasser, id.magneboots}
	},
	quartu={
		casual={id.grindboots}
	},
	kalebo={
		casual={id.swingshot}
	},
	fleet={
		casual={id.thruster_pack, id.swingshot, id.hologuise}
	},
	veldin={
		casual={id.magneboots, id.hologuise}
	},
}

function Invert(table)
    local output={}
    for k,v in pairs(table) do
        output[v]=k
    end
    return output
end

--big casual test--
for check,strats in pairs(tech) do
    for strat,items in pairs(strats) do
        if strat:find('casual') then
            local output_string = strat..' strats for '..check..' require: '
            for _,item in ipairs(items) do
                output_string = output_string..Invert(id)[item]..', '
            end
            print(output_string)
        end
    end
end
--table of checks that look for strats--