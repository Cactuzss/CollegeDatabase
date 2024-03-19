SELECT * FROM disciplines
WHERE hours_of_study >= ANY 
	(SELECT hours_of_study FROM disciplines WHERE title = 'Современное искусство');