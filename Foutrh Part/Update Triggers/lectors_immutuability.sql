CREATE TRIGGER lecturers_IMMUTUABILITY
ON lecturers
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @error_code INT = 52002;
    
    BEGIN TRY
		THROW @error_code, 'lecturers are immutuable', 1
    END TRY
    
    BEGIN CATCH
    	PRINT @error_code
		ROLLBACK TRANSACTION
    END CATCH
END