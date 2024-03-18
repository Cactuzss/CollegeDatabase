CREATE TRIGGER student_deletion
ON students
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @stud_id INT;
    SELECT @stud_id = id FROM deleted;
    
    DELETE FROM grades
    WHERE student_id = @stud_id
    
    DELETE FROM groups
    WHERE headman_id = @stud_id
END;