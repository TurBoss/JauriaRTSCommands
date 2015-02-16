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
		
		siren = { 
			file = "sounds/siren.ogg",
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		mine1 = { 
			file = "sounds/sboom.ogg",
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		carson1 = { 
			file = "sounds/Gun2.ogg",
			gain = 2.0,
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		carson2 = { 
			file = "sounds/M4Shoot.ogg",
			gain = 0.7,
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 20, ---how many maximum can we hear?
		},
		kortus1 ={ 
			file = "sounds/Shootgunbig.ogg",
			rolloff=3,
			gain = 0.5,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		kortus2 ={ 
			file = "sounds/Shootgun2.ogg",
			gain = 0.6,
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		kortus3 ={ 
			file = "sounds/Stun.ogg", 
			gain = 0.5,
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		erzeus1 ={ 
			file = "sounds/Sniper.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		erzeus2 ={ 
			file = "sounds/SniperRifle.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		stirek1 ={ 
			file = "sounds/Laser.ogg", 
			rolloff=3,
			dopplerscale = 0,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 5, ---how many maximum can we hear?
		},
		default = {
			gainmod = 0.35,
			pitchmod = 0.3,
			pitch = 0.7,
			in3d = true,
		},
	},
}

return Sounds
