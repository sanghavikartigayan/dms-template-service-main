delete from dmstemplate.template_history where audit_id = 'b059f61a-e9ff-4543-b6c8-9c4e63279631';
delete from dmstemplate.template_history where audit_id = 'b059f61a-e9ff-4543-b6c8-9c4e63279632';
delete from dmstemplate.template_history where audit_id = 'b059f61a-e9ff-4543-b6c8-9c4e63279634';
delete from dmstemplate.template_history where audit_id = 'b059f61a-e9ff-4543-b6c8-9c4e63279635';

insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                              modified_on, template_fields, template_data, is_active, version, created_by,
                                              created_on)
select 'b059f61a-e9ff-4543-b6c8-9c4e63279631', template_id, process_id,template_name,template_type, approved_by, modified_by,
       current_timestamp, template_fields, template_data, is_active, version, created_by,
       current_timestamp
from dmstemplate.template
where template_id ='6ffd6a5a-198e-11ed-861d-0242ac120017';


insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                          modified_on, template_fields, template_data, is_active, version, created_by,
                                          created_on)
select 'b059f61a-e9ff-4543-b6c8-9c4e63279632', template_id, process_id,template_name,template_type, approved_by, modified_by,
       current_timestamp, template_fields, template_data, is_active, version, created_by,
       current_timestamp
from dmstemplate.template
where template_id ='6ffd6a5a-198e-11ed-861d-0242ac120016';


insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                              modified_on, template_fields, template_data, is_active, version, created_by,
                                              created_on)
select 'b059f61a-e9ff-4543-b6c8-9c4e63279634', template_id, process_id,template_name,template_type, approved_by, modified_by,
       current_timestamp, template_fields, template_data, is_active, version, created_by,
       current_timestamp
from dmstemplate.template
where template_id ='6ffd6a5a-198e-11ed-861d-0242ac120019';


insert into dmstemplate.template_history (audit_id,template_id, process_id, template_name, template_type, approved_by, modified_by,
                                          modified_on, template_fields, template_data, is_active, version, created_by,
                                          created_on)
select 'b059f61a-e9ff-4543-b6c8-9c4e63279635', template_id, process_id,template_name,template_type, approved_by, modified_by,
       current_timestamp, template_fields, template_data, is_active, version, created_by,
       current_timestamp
from dmstemplate.template
where template_id ='6ffd6a5a-198e-11ed-861d-0242ac120020';

