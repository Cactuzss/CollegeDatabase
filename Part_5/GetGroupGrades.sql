CREATE PROCEDURE GetGroupGrades @curator_name VARCHAR(64) AS
BEGIN
	DECLARE @curator_id INT
	SELECT @curator_id =id FROM lecturers WHERE full_name = @curator_name

	DECLARE @group_id INT
	SELECT @group_id = id FROM groups WHERE curator_id = @curator_id

	SELECT disciplines.title, students.full_name, result FROM grades
		JOIN disciplines ON discipline_id = disciplines.id
		JOIN students ON student_id = students.id
	WHERE students.group_id = @group_id
END