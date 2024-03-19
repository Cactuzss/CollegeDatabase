CREATE TRIGGER faculties_protector
ON faculties
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @error_code INT = 53002;

	BEGIN TRY
    THROW @error_code, 'You cant delete this', 1
	END TRY
	BEGIN CATCH
		IF @@ERROR != 0
			PRINT @error_code;
			ROLLBACK TRANSACTION;
	END CATCH;
END;