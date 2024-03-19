CREATE TRIGGER discipline_deletion
ON disciplines
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @disc_id INT;
    SELECT @disc_id = id FROM deleted;
    
    DELETE FROM disciplines_lecturers
    WHERE discipline_id = @disc_id;
    
    DELETE FROM grades
    WHERE discipline_id = @disc_id;
END;