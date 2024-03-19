CREATE PROCEDURE LinkStudentToGroup @student_name VARCHAR(64), @curator_name VARCHAR(64) AS
BEGIN
	DECLARE @student_id INT;
	SELECT @student_id = id FROM students WHERE full_name = @student_name;
	
	DECLARE @curator_id INT;
	SELECT @curator_id = id FROM lecturers WHERE full_name = @curator_name;

	DECLARE @group_id INT;
	SELECT @group_id = id FROM groups WHERE curator_id = @curator_id;

	UPDATE students
	SET group_id = @group_id
	WHERE id = @student_id
END