SELECT rev.`rev_changeId`, MAX(rev.`rev_patchSetNum`) AS last_patch
FROM `t_change` ch INNER JOIN `t_revision` rev ON ch.`id` = rev.`rev_changeId`
	INNER JOIN t_file f ON f.`f_revisionId` = rev.id
WHERE ch.`ch_project` = 'openstack/neutron' AND ch.`ch_status` = 'MERGED' AND ch.`ch_branch` = 'master' AND f.`f_fileName` LIKE '%.py'
GROUP BY rev.`rev_changeId`
HAVING MAX(rev.`rev_patchSetNum`) > 1
