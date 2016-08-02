SELECT f.`f_fileName`, f.`f_linesInserted`, f.`f_linesDeleted`, heat2.`change_id_db`, heat2.`version`
FROM change_heat_v2 heat2 INNER JOIN t_file f ON heat2.`rev_id_db` = f.`f_revisionId`
WHERE f.`f_fileName` LIKE '%.py'
