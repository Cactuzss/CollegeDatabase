
CREATE TRIGGER speciality_deletion
ON specialities
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @spec_id INT;
    SELECT @spec_id = id FROM deleted;
    
    DECLARE @error_message INT = 53001;
    
    BEGIN TRY
    	IF EXISTS(SELECT * FROM students WHERE speciality_id = @spec_id)
        	THROW @error_message, 'Value is using somewhere else', 1
            
        DELETE FROM  specialities
        WHERE id = @spec_id
    END TRY
    BEGIN CATCH
    PRINT @error_message
    END CATCH
END;