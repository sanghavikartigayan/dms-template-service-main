truncate dmstemplate.template;

ALTER TABLE dmstemplate.template ADD COLUMN  created_by varchar(255) not null;
ALTER TABLE dmstemplate.template ADD COLUMN  created_on timestamp not null;

DROP TABLE IF EXISTS  dmstemplate.template_history;
CREATE TABLE IF NOT EXISTS dmstemplate.template_history
(
    audit_id uuid not null,
    template_id uuid not null,
    version integer  not null,
    process_id text  not null,
    template_name varchar(255)  not null,
    template_type varchar(36)  not null,
    approved_by varchar(255) ,
    template_fields jsonb  not null,
    template_data bytea  not null,
    is_active boolean  not null,
    created_by varchar(255) not null,
    created_on timestamp not null,
    modified_by varchar(255)  not null,
    modified_on timestamp  not null,
    CONSTRAINT template_id_version_unique UNIQUE (template_id, version),
    CONSTRAINT template_history_pk PRIMARY KEY (audit_id)
    );

create or replace view dmstemplate.template_audit_vw as
select audit_id,
    template_id,
    version,
    process_id,
    template_name,
    template_type,
    approved_by,
    template_fields,
    template_data,
    is_active,
    created_by,
    created_on,
    modified_by,
    modified_on
from dmstemplate.template_history;

GRANT ALL ON dmstemplate.template_audit_vw TO dmstemplate_user;
GRANT ALL ON dmstemplate.template_history TO dmstemplate_user;

