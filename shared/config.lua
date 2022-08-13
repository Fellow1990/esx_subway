Config                      	= {}
Config.DrawDistance             = 5.0
Config.Distance               	= 1.5
Config.Locale               	= 'fr'

Config.SubwayBlip = {
	Coords = vector3(-1249.505981, -297.081848, 37.348869),
	Sprite  = 293,
	Display = 4,
	Scale   = 0.7,
	Colour  = 24,
}

Config.Subway = {
	SpawnVeh = vector4(-1254.902222, -269.206482, 38.180248, 301.081848),
}

Config.Zones = {

	Garage = {
		Pos   = vector3(-1254.939697, -273.812927, 38.985863),
		message = "Accéder au garage",
		event = "esx_subway:openGarage",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

	Stock = {
		Pos   = vector3(-1256.740234, -278.990112, 37.353382),
		message = "Accéder au stock",
		event = "esx_subway:openStock",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

	Boss = {
		Pos   = vector3(-1255.072876, -284.305756, 37.355324),
		message = "Accéder à la gestion",
		event = "esx_subway:openBoss",
		grade = {boss = true},
	},

}

Config.Shops = {

	Juice = {
		Model   = -1369928609,
		message = "Faire un jus d'orange",
		event = "esx_subway:takeOrangejuice",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

	Coffee = {
		Model   = -938179374,
		message = "Faire un café",
		event = "esx_subway:takeCoffee",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

	Milkshake = {
		Model   = -1415058956,
		message = "Prendre un milkshake",
		event = "esx_subway:takeMilkshake",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

	Fresh = {
		Model   = -1153271191,
		item	= 'cola',
		message = "Prende un cola",
		event = "esx_subway:takeCola",
		grade = {conveyor = true, employer = true, chef = true, coboss = true, boss = true},
	},

}

Config.cars = {
	{nom = "Ranger véhicule", modele = ""},
    {nom = "Blista", modele = "blista"},
	{nom = "T20", modele = "t20"},
	{nom = "Adder", modele = "adder"},
}

Config.Color = 255, 0, 0
Config.Plate = "Subway"