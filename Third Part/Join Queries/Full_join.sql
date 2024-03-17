SELECT * FROM grades
	FULL JOIN students ON student_id = students.id
    FULL JOIN disciplines ON disciplines.id = discipline_id;