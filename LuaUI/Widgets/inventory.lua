function widget:GetInfo()
	return {
		name		= "Inventory",
		desc		= "Shows unit weapons.",
		author		= "TurBoss",
		date		= "8/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true,
	}
end

local selUnitID
local weaponName = {}
local unitWeapons = {}

local spGetViewGeometry	= Spring.GetViewGeometry
local spGetSelectedUnitsSorted = Spring.GetSelectedUnitsSorted

local screenSizeX, screenSizeY	= spGetViewGeometry()

local Chili
local black	= {0.1, 0.1, 0.1, 1.0}
local grey	= {0.5, 0.5, 0.5, 1.0}
local white	= {1.0, 1.0, 1.0, 1.0}
local red	= {0.8, 0.0, 0.0, 1.0}

local inventoryWindow, inventoryPanel1, inventoryPanel2, weaponImage1, weaponImage2

local function CreateWindow()

	inventoryWindow	= Chili.Window:New{
		parent		= Chili.Screen0;
		name		= "inventory window";
		x			= "57%";
		y			= "88.6%";
		width		= "15%";
		height		= "11.5%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
		padding		= {2,2,2,2};
		children	= {
			Chili.Label:New{
				caption	= "Primary";
				y		= "6%";
				x		= "7.5%";
				fontsize = math.floor(screenSizeX/75);
			},
			Chili.Label:New{
				caption	= "Secondary";
				y		= "6%";
				x		= "50%";
				fontsize = math.floor(screenSizeX/75);
			},
		},
	}
	
	inventoryPanel1	= Chili.Panel:New{
		parent		= inventoryWindow;
		name		= "primary weapon";
		padding 	= {10,10,10,10};
		x			= "5%";
		y			= "35%";
		width		= "40%";
		height		= "60%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
		children	= {
			Chili.Label:New{
				caption	= "A";
				y		= "30%";
				x		= "70%";
				fontsize = math.floor(screenSizeX/75);
			},
		};
	}
	
	inventoryPanel2	= Chili.Panel:New{
		parent		= inventoryWindow;
		name		= "secondary weapon";
		padding 	= {10,10,10,10};
		x			= "55%";
		y			= "35%";
		width		= "40%";
		height		= "60%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
		children	= {
			Chili.Label:New{
				caption	= "D";
				y		= "30%";
				x		= "70%";
				fontsize = math.floor(screenSizeX/75);
			},
		};
	}
	
end

function drawWeapon(weapon)

	weaponImage1 = Chili.Image:New {
		parent = inventoryPanel1;
		file = ":cl:luaui/images/weapons/"..weapon[1]..".png";
		x		= 0;
		y		= 0;
		width	= "100%";
		height	= "100%";
	};
	
	weaponImage2 = Chili.Image:New {
		parent = inventoryPanel2;
		file = ":cl:luaui/images/weapons/"..weapon[2]..".png";
		x		= 0;
		y		= 0;
		width	= "100%";
		height	= "100%";
	};
end

local function UpdateSelection()
  local sel = spGetSelectedUnitsSorted()
  for unitDefID, unitIDs in pairs(sel) do
	if unitDefID == "n" then
		break
	end
	
	selUnitID = unitDefID
	
	local weapon = {}
	weapon[1] = unitWeapons[selUnitID][1]
	weapon[2] = unitWeapons[selUnitID][3]
	Spring.Echo(weapon)
	
	drawWeapon(weapon)
 end
end

local function SetupUnitDef(unitDefID, unitDef)
	if (not unitDef.weapons) then return end
	for num, weapon in ipairs(unitDef.weapons) do
		if (weapon.weaponDef) then
			local weaponDef = WeaponDefs[weapon.weaponDef]
			if (weaponDef) then
				local name = weaponDef.name
				weaponName[num] = name
			end
		end
	end
	return weaponName
end

--------------------------------------------------------------------------------
-- callins
--------------------------------------------------------------------------------

function widget:Initialize()
	Chili = WG.Chili
	
	if (not Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
	for unitDefID, unitDef in ipairs(UnitDefs) do
		unitWeapons[unitDefID] = SetupUnitDef(unitDefID, unitDef)
		Spring.Echo(unitDefID)
		Spring.Echo(unitWeapons[unitDefID])
	end
	
	for index, weapons in ipairs(unitWeapons) do
		Spring.Echo(index)
		Spring.Echo(weapons)
	end
	CreateWindow()
end

function widget:SelectionChanged(sel)
	if sel[1] == nil then
		weaponImage1:Dispose()
		weaponImage2:Dispose()
		weaponImage1 = nil
		weaponImage2 = nil
	end
	UpdateSelection()
end
