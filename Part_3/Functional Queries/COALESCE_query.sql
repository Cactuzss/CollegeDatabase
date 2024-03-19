SELECT *,
COALESCE(id, headman_id, curator_id) AS FirstNotNull
FROM groups