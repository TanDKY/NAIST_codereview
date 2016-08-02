SELECT heat2.`rev_id`, al.`branch_name`, heat2.`version`, heat2.`change_id_db`
FROM change_heat_v2 heat2 INNER JOIN revision_all_heat al ON heat2.`rev_id` = al.`revision_id`
WHERE al.`branch_name` LIKE 'refs/changes/%'
