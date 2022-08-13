INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_subway', 'Subway', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_subway', 'Subway', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_subway', 'Subway', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('subway', 'Subway')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('subway',0,'stagiaire','Stagiaire',20,'{}','{}'),
	('subway',1,'employer','Employer',40,'{}','{}'),
	('subway',2,'chef','Gérant Cuisine',60,'{}','{}'),
	('subway',3,'coboss','DRH',85,'{}','{}'),
	('subway',4,'boss','Patron',100,'{}','{}')
;