model = {
<<<<<<< HEAD
   radius = 6,
   --height = 10,
   midpos = {0,18,0}, -- model center offset
=======
   radius = 14,
   --height = 10,
   midpos = {0,14,0}, -- model center offset
>>>>>>> dc443e36a8cd25f17cd5995ba68640052bd2d9eb
   --[[tex1 = "corraid1_512.dds", -- same as S3O texture 1
   tex2 = "corraid2_512.dds", -- same as S3O texture 2
   invertteamcolor = true, -- invert tex1 alpha channel
   fliptextures = true, -- turn textures upside down
   pieces = {
      root = {
         rotate = {-90,0,0},
         offset = {10,0,0}
      },
      turret = {
         parent = "chassis",
         rotateZ = 30,
         offsetY = 20,
      }
   }]]--
}
return model
