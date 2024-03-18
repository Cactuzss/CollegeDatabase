CREATE PROCEDURE GetGrades AS
BEGIN
	SELECT students.full_name, disciplines.title, result FROM grades
    	JOIN students on students.id = student_id
        JOIN disciplines ON disciplines.id = discipline_id
END