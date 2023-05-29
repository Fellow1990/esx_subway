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
		grade = 0, -- Minimum access rank
	},

	Boss = {
		Pos   = vector3(-1255.072876, -284.305756, 37.355324),
		message = "Accéder à la gestion",
		icon = "fa-solid fa-euro-sign",
		event = "esx_subway:openBoss",
		grade = 3, -- Minimum access rank
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
