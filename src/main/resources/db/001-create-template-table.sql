
DROP TABLE IF EXISTS  dmstemplate.template;
CREATE TABLE IF NOT EXISTS dmstemplate.template
(
    template_id uuid NOT NULL,
    process_id text,
    template_name varchar(255) COLLATE pg_catalog."default",
    template_type varchar(36) COLLATE pg_catalog."default",
    approved_by varchar(255) COLLATE pg_catalog."default",
    modified_by varchar(255) COLLATE pg_catalog."default",
    modified_on date,
    template_fields jsonb,
    template_data bytea,
    is_active boolean,
    version integer,
    CONSTRAINT template_pkey PRIMARY KEY (template_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
