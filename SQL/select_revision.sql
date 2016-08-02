SELECT rev.`id` as rev_id_db, rev.`rev_id`, heat.`change_id_db`, rev.`rev_patchSetNum`
FROM `change_heat` heat INNER JOIN `t_revision` rev ON heat.`change_id_db` = rev.`rev_changeId`
	INNER JOIN (SELECT heat.`change_id_db`, COUNT(rev.`rev_patchSetNum`)
		FROM `change_heat` heat INNER JOIN `t_revision` rev ON heat.`change_id_db` = rev.`rev_changeId`
		WHERE heat.`last_patch` = rev.`rev_patchSetNum` OR rev.`rev_patchSetNum` = 1
		GROUP BY heat.`change_id_db`
		HAVING COUNT(rev.`rev_patchSetNum`) > 1) h1 ON heat.`change_id_db` = h1.change_id_db
WHERE heat.`last_patch` = rev.`rev_patchSetNum` OR rev.`rev_patchSetNum` = 1
