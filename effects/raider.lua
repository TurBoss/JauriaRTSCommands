-- raidshells
-- raiddust
-- raidmuzzle

return {
  ["raidshells"] = {
    muzzleflash = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.90,
        colormap           = [[1 0.7 0.2 0.01    1 0.7 0.2 0.01    0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 90,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 5,
        particlelife       = 2,
        particlelifespread = 5,
        particlesize       = 1,
        particlesizespread = 0.3,
        particlespeed      = 0.4,
        particlespeedspread = 0.4,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[plasma]],
      },
    },
    shells = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.97,
        colormap           = [[1 1 1 1   1 1 1 1]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, -0.5, 0]],
        numparticles       = 1,
        particlelife       = 25,
        particlelifespread = 0,
        particlesize       = 3,
        particlesizespread = 0,
        particlespeed      = 4,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[shell]],
      },
    },
  },

  ["raiddust"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.9,
      flashsize          = 60,
      ttl                = 4,
      color = {
        [1]  = 1,
        [2]  = 0.5,
        [3]  = 0,
      },
    },
    muzzleflash = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 0,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.8,
        colormap           = [[0.72 0.61 0.41 1      0 0 0 0.01]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.05, 0]],
        numparticles       = 20,
        particlelife       = 30,
        particlelifespread = 0,
        particlesize       = 1,
        particlesizespread = 2,
        particlespeed      = 6,
        particlespeedspread = 6,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = 1.0,
        texture            = [[smokesmall]],
      },
    },
  },

  ["raidmuzzle"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 0.5 0.01	1 0.7 0 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0.3,
        fronttexture       = [[plasma0029]],
        length             = 1,
        sidetexture        = [[plasma2]],
        size               = 0.5,
        sizegrowth         = 70,
        ttl                = 5,
      },
    },
    muzzleflash = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.90,
        colormap           = [[1 0.7 0.2 0.01    1 0.7 0.2 0.01    0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 20,
        particlelife       = 18,
        particlelifespread = 5,
        particlesize       = 1,
        particlesizespread = 0.3,
        particlespeed      = 2,
        particlespeedspread = 4,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[plasma]],
      },
    },
    muzzlesmoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.8,
        colormap           = [[0 0 0 0.01  0.5 0.5 0.5 0.5     0 0 0 0.01]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 20,
        particlelifespread = 0,
        particlesize       = [[7 i-0.4]],
        particlesizespread = 1,
        particlespeed      = [[10 i-1]],
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[smokesmall]],
      },
    },
  },

}
