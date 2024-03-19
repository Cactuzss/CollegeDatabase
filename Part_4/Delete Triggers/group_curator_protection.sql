CREATE TRIGGER curator_DELETION
ON lecturers
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @error_code INT = 53001;
    
	DECLARE @curator_id INT;
    SELECT @curator_id = id FROM deleted;
    
	BEGIN TRY
    
    IF EXISTS(SELECT groups.curator_id FROM groups WHERE groups.curator_id = @curator_id)
    	THROW @error_code, 'Do something with group', 1
    
    DELETE FROM lecturers
    WHERE lecturers.id = @curator_id
    
	END TRY
	BEGIN CATCH
		IF @@ERROR != 0
			PRINT @error_code;
			ROLLBACK TRANSACTION;
	END CATCH;
END;