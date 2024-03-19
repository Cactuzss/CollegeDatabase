CREATE PROCEDURE AddDiscipline @lecturer_name VARCHAR(64), @discipline_title VARCHAR(64) AS
BEGIN
	DECLARE @lecturer_id INT;
	DECLARE @discipline_id INT;

	SELECT @lecturer_id = id FROM lecturers WHERE full_name = @lecturer_id;
	SELECT @discipline_id = id FROM disciplines WHERE disciplines.title = @discipline_title

	INSERT INTO disciplines_lecturers(lecturer_id, discipline_id)
	VALUES(
		@lecturer_id,
		@discipline_id
	);
END