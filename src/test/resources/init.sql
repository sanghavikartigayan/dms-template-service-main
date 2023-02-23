CREATE
USER dmstemplate_user;
CREATE SCHEMA dmstemplate
    AUTHORIZATION dmstemplate_user;

GRANT
ALL
ON SCHEMA dmstemplate TO PUBLIC;
GRANT ALL
ON SCHEMA dmstemplate TO dmstemplate_user;

DROP TABLE IF EXISTS  dmstemplate.template;
CREATE TABLE IF NOT EXISTS dmstemplate.template
(
    template_id uuid NOT NULL,
    process_id text,
    template_name varchar(255),
    template_type varchar(36),
    approved_by varchar(255),
    modified_by varchar(255),
    modified_on timestamp,
    template_fields jsonb,
    template_stamp jsonb,
    template_data bytea,
    is_active boolean,
    version integer,
    created_by varchar(255),
    created_on timestamp,
    CONSTRAINT template_pkey PRIMARY KEY (template_id)
);


DROP TABLE IF EXISTS  dmstemplate.template_history;
CREATE TABLE IF NOT EXISTS dmstemplate.template_history
(
    audit_id uuid not null,
    template_id uuid not null,
    version integer  not null,
    process_id text ,
    template_name varchar(255),
    template_type varchar(36),
    approved_by varchar(255) ,
    template_fields jsonb ,
    template_stamp jsonb,
    template_data bytea,
    is_active boolean ,
    created_by varchar(255),
    created_on timestamp,
    modified_by varchar(255),
    modified_on timestamp,
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
