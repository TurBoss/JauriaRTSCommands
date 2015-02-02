
--------------------------------------------------------------------------------
-- pieces
--------------------------------------------------------------------------------

local root = piece "root"
local mina = piece "base"
local mastil = piece "mastil"
local bola = piece "bola"
local bandera = piece "bandera"

--------------------------------------------------------------------------------
-- funcs
--------------------------------------------------------------------------------

function script.Create ()
end

function script.WindChanged(heading, strength)
	Spring.Echo("TEST")
	Turn(bola, z_axis, heading, math.rad(20))
end
