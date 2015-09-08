--insert project users to whitelist
INSERT INTO redcap_user_whitelist (username)   
SELECT distinct username  
FROM redcap_user_rights AS r  
WHERE r.username NOT IN
 (SELECT username FROM redcap_user_whitelist);

--show project users not on whitelist
select distinct r.username 
from redcap_user_rights r 
left join redcap_user_whitelist w 
on r.username = w.username 
where w.username is null;

--create log event for adding user to whitelist
INSERT INTO redcap_log_event 
			(project_id, ts, user, ip, page, event, object_type, sql_log, pk, event_id, data_values, description, change_reason) 
			VALUES (0, 20150807045913, 'site_admin', '127.0.0.1', 'ControlCenter/user_white_list.php', 'MANAGE', 'redcap_user_whitelist', 'insert into redcap_user_whitelist values (\'jhj888\')', 
			NULL, NULL, NULL, 'Add users to whitelist', NULL)




