
ALTER TABLE dmstemplate.template ALTER COLUMN  process_id SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  template_name SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  template_type SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  modified_by SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  modified_on SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  template_fields SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  template_data SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  is_active SET NOT NULL;
ALTER TABLE dmstemplate.template ALTER COLUMN  version SET NOT NULL;

