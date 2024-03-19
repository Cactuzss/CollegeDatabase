CREATE PROCEDURE GetStudentGrades @full_name VARCHAR(64) AS
BEGIN
	SELECT students.full_name, disciplines.title, grades.result FROM grades
		JOIN disciplines ON discipline_id = disciplines.id
		JOIN students ON student_id = students.id
	WHERE students.full_name = @full_name

END