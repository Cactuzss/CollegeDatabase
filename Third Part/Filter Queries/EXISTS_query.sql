SELECT * FROM disciplines
WHERE EXISTS
	(SELECT hours_of_study FROM disciplines 
     WHERE hours_of_study >= 120);