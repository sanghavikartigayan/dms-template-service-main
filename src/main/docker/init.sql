CREATE SCHEMA dmstemplate
    AUTHORIZATION dmstemplate_user;

GRANT ALL ON SCHEMA dmstemplate TO PUBLIC;

GRANT ALL ON SCHEMA dmstemplate TO dmstemplate_user;