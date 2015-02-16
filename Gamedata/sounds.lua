local Sounds = {
	SoundItems = {
		--- RESERVED FOR SPRING, DON'T REMOVE
		IncomingChat = {
			file = "sounds/incoming_chat.ogg",
			 rolloff = 0.1, 
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		MultiSelect = {
			file = "sounds/multiselect.ogg",
			rolloff = 0.1, 
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		MapPoint = {
			file = "sounds/mappoint.ogg",
			rolloff = 0.1,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		FailedCommand = {
			file = "sounds/mappoint.ogg",
			rolloff = 0.1,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		--- END RESERVED

		--WEAPONS

		carson1 = { 
			file = "sounds/Gun2.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		carson2 = { 
			file = "sounds/M4Shoot.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		kortus1 ={ 
			file = "sounds/Shootgunbig.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		kortus2 ={ 
			file = "sounds/Shootgun2.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		Erzeus1 ={ 
			file = "sounds/Sniper.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		Erzeus2 ={ 
			file = "sounds/SniperRifle.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
		Stirek1 ={ 
			file = "sounds/Laser.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 6000,
			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
	},
}

return Sounds
