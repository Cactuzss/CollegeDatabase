SELECT disciplines.title FROM disciplines_lecturers
	JOIN disciplines ON discipline_id = disciplines.id
    JOIN lecturers ON lecturer_id = lecturers.id
    GROUP BY title