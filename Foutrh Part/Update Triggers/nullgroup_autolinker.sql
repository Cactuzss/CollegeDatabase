CREATE TRIGGER students_LINK_TO_HEADMAN
ON students
AFTER UPDATE
AS
BEGIN
	DECLARE @inserted_group_id INT;
    SELECT @inserted_group_id = group_id FROM inserted;
    
    IF (SELECT headman_id FROM groups WHERE groups.id = @inserted_group_id) = NULL
    	UPDATE groups
        SET headman_id = (SELECT id FROM inserted)
        WHERE groups.id = @inserted_group_id
        
END