--REDCap project access vs study APL report--
--parameter - @STU

select rc.project_irb_number, rc.username, rc.project_id
from(
	--REDCap STU and netid
	select p.project_irb_number, r.username, r.project_id
	from redcap_user_rights r
	left join redcap_projects p on r.project_id = p.project_id
	order by p.project_irb_number)
	rc
left join(
	--IRB STU and netid
	select ap.irb_study_id, ap.netid
	from edw.fsm_eirb_dm.authorized_personnel_person ap
	join edw.fsm_eirb_dm.studies s
	on ap.irb_study_id - s.irb_study_id
	where study_status like 'Approved'
	order by irb_study_id)
	irb
on rc.project_irb_number = irb.irb_study_id
where irb.irb_study_id IS NULL




--list of project owners
select username, role_name, p.project_irb_number
from redcap_user_rights r
left join redcap_user_roles o on r.role_id = o.role_id
left join redcap_projects p on r.project_id = p.project_id
order by role_name;


--stu drill down--
user list, listed on IRB (y/n)

--REDCap whitelist vs irb report--
whitelist vs full list of netids on all apls in IRB

STU0898480923 234 sdf 234234


filter by project type? (research, operations, just for fun, etc)
filter by STU null?
filter by user list matches APL vs user list does not match APL
