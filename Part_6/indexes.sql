USE _Institute_;

CREATE NONCLUSTERED INDEX idx_students_name 
ON students (full_name, id);

CREATE CLUSTERED INDEX idx_dslec_ids
ON disciplines_lecturers(lecturer_id)