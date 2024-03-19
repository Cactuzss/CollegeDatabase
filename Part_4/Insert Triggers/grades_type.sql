CREATE TRIGGER grade_TYPE_CHECK
ON grades
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @error_code INT = 51002;

	DECLARE @inserted_result VARCHAR(64);
	SELECT @inserted_result = result FROM inserted;

	DECLARE @discipline_control_form VARCHAR(128);
	SELECT @discipline_control_form = control_forms.title FROM inserted
		JOIN disciplines	ON discipline_id = disciplines.id
		JOIN control_forms	ON disciplines.control_fofm_id = control_forms.id;

	BEGIN TRY
			IF @discipline_control_form = 'Зачёт'
				IF @inserted_result NOT IN('Зачёт', 'Не зачёт')
					THROW @error_code, 'Invalid inserted result type', 1;

			IF @discipline_control_form = 'Дифференцированный зачёт'
				IF (CAST(@inserted_result AS INT) < 1 OR CAST(@inserted_result AS INT) > 5)
					THROW @error_code, 'Invalid inserted result type', 1;

			IF @discipline_control_form = 'Экзамен'
				IF (CAST(@inserted_result AS INT) < 0 OR CAST(@inserted_result AS INT) > 100)
					THROW @error_code, 'Invalid inserted result type', 1;

			INSERT INTO grades(discipline_id, student_id, result)
			SELECT discipline_id, student_id, result FROM inserted;

	END TRY
	BEGIN CATCH
		IF @@ERROR != 0
			PRINT @error_code;
			ROLLBACK TRANSACTION;
	END CATCH;
END;