
--------------------------------------------------------------------------------
-- pieces
--------------------------------------------------------------------------------

local root = piece "root"

local caja1 = piece "caja1"
local caja2 = piece "caja2"
local caja3 = piece "caja3"

local mastil = piece "mastil"
local bola = piece "bola"
local bandera = piece "bandera"

--------------------------------------------------------------------------------
-- funcs
--------------------------------------------------------------------------------

function script.Create ()
end

function script.WindChanged(heading, strength)
	Turn(bola, z_axis, heading, math.rad(20))
end
