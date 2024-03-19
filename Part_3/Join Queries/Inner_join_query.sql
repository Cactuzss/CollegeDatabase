SELECT full_name, title FROM disciplines_lecturers
	INNER JOIN lecturers ON lecturer_id = lecturers.id
    INNER JOIN disciplines ON discipline_id = disciplines.id;