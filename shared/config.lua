Config                      	= {}
Config.DrawDistance             = 5.0
Config.Distance               	= 0.5
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
		icon = "fa-sharp fa-solid fa-car",
		event = "esx_subway:openGarage",
		ox_grade = {['0'] = true, ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true},
	},

	Boss = {
		Pos   = vector3(-1255.072876, -284.305756, 37.355324),
		message = "Accéder à la gestion",
		icon = "fa-solid fa-euro-sign",
		event = "esx_subway:openBoss",
		ox_grade = {['4'] = true},
	},

}

Config.Shops = {

	Juice = {
		Pos = vector3(-1254.135864, -288.600189, 37.354916),
		message = "Faire un jus d'orange",
		icon = "fa-sharp fa-solid fa-caret-up",
		event = "esx_subway:takeOrangejuice",
		ox_grade = {['0'] = true, ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true},
	},

	Coffee = {
		Pos = vector3(-1254.851074, -287.108704, 37.355412),
		message = "Faire un café",
		icon = "fa-sharp fa-solid fa-caret-up",
		event = "esx_subway:takeCoffee",
		ox_grade = {['0'] = true, ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true},
	},

	Milkshake = {
		Pos = vector3(-1255.614014, -285.651947, 37.355873),
		message = "Prendre un milkshake",
		icon = "fa-sharp fa-solid fa-caret-up",
		event = "esx_subway:takeMilkshake",
		ox_grade = {['0'] = true, ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true},
	},

	Fresh = {
		Pos = vector3(-1256.242188, -284.134125, 37.356308),
		item	= 'cola',
		icon = "fa-sharp fa-solid fa-caret-up",
		message = "Prende un cola",
		event = "esx_subway:takeCola",
		ox_grade = {['0'] = true, ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true},
	},

}

Config.cars = {
	{nom = "Ranger véhicule", modele = ""},
    {nom = "Blista", modele = "blista"},
	{nom = "T20", modele = "t20"},
	{nom = "Adder", modele = "adder"},
}

Config.ColorCar = {
	Red = 255,
	Green = 0,
	Blue = 0
}
Config.Plate = "Subway"
