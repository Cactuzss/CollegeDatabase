SELECT full_name,
    CASE departament_id
        WHEN 0 THEN (SELECT title FROM departaments WHERE id = 0)
        WHEN 1 THEN (SELECT title FROM departaments WHERE id = 1)
        WHEN 2 THEN (SELECT title FROM departaments WHERE id = 2)
        ELSE 'There is no such departament'
    END AS departament
FROM lecturers