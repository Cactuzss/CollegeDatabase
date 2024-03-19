SELECT * FROM buildings
	LEFT JOIN adresses ON adress_id = adresses.id;
	
-- SELECT * FROM buildings
--	RIGHT JOIN adresses ON adress_id = adresses.id;