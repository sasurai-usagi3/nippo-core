crumb :root do
  link "Home", root_path
end

crumb :user do
  link 'user profile', users_path
  parent :root
end

crumb :new_group do
  link 'new group', new_group_path
  parent :root
end

crumb :groups do
  link 'groups index', groups_path
  parent :root
end

crumb :group do |group|
  link group.name, group
  parent :groups
end

crumb :group_reports do |group|
  link 'reports', [group, :reports]
  parent :group, group
end

crumb :group_report do |report|
  link report.title, [report.group, report]
  parent :group_reports, report.group
end

crumb :new_group_report do |group|
  link 'new report', new_group_report_path(group_id: group)
  parent :group_reports, group
end

crumb :group_group_member_relations do |group|
  link 'unaccepted requests', [group, :group_member_relations]
  parent :group, group
end

crumb :new_group_group_member_relation do |group|
  link 'invite user', new_group_group_member_relation_path(group_id: group.id)
  parent :group, group
end
