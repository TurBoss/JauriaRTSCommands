-- levlrmuzzle

return {
  ["levlrmuzzle"] = {
    fireball = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.8,
        colormap           = [[1 1 1 0.01  1 1 1 0.01  1 1 1 0.01 0 0 0 0.01]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 5,
        particlelifespread = 0,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = 0,
        particlespeedspread = 1,
        pos                = [[0, 3, 0]],
        sizegrowth         = 5,
        sizemod            = 1.0,
        texture            = [[exp00_5]],
      },
    },
  },

}

