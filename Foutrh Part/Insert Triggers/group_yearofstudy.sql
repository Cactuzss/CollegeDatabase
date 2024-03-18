CREATE TRIGGER groups_YEAR_CHECK
ON groups
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @error_code INT = 51004

	DECLARE @inserted_year INT;
    SELECT @inserted_year FROM inserted;

	BEGIN TRY;
		IF (CAST(@inserted_year AS INT) < 0 OR CAST(@inserted_year AS INT) > 4)
			 THROW @error_code, 'Invalid inserted result type', 1;
             
        INSERT INTO groups(speciality_id, curator_id, headman_id, year_of_study)
        SELECT speciality_id, curator_id, headman_id, year_of_study FROM inserted;
	END TRY

	BEGIN CATCH
    IF @@ERROR != 0
    	PRINT @@ERROR
		ROLLBACK TRANSACTION
	END CATCH
END