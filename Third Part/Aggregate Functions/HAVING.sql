SELECT disciplines.title, COUNT(*) as cnt FROM disciplines_lecturers
	JOIN disciplines ON discipline_id = disciplines.id
    JOIN lecturers ON lecturer_id = lecturers.id
    GROUP BY title
    HAVING COUNT(*)  > 1;