CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE applications (
    application_id uuid NOT NULL,
    user_id text NULL,
    program_id uuid NOT NULL,
    requirements_accepted boolean NOT NULL,
    discipline_id uuid NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    CONSTRAINT pk_applications PRIMARY KEY (application_id)
);

CREATE TABLE disciplines (
    discipline_id uuid NOT NULL,
    name text NULL,
    date_modified timestamp without time zone NOT NULL,
    CONSTRAINT pk_disciplines PRIMARY KEY (discipline_id)
);

CREATE TABLE program_types (
    program_type_id uuid NOT NULL,
    name text NULL,
    date_modified timestamp without time zone NOT NULL,
    CONSTRAINT pk_program_types PRIMARY KEY (program_type_id)
);

CREATE TABLE universities (
    university_id uuid NOT NULL,
    name text NULL,
    url text NULL,
    tracking_id text NULL,
    institution_id text NULL,
    date_modified timestamp without time zone NOT NULL,
    CONSTRAINT pk_universities PRIMARY KEY (university_id)
);

CREATE TABLE programs (
    program_id uuid NOT NULL,
    name text NULL,
    code text NULL,
    form_id integer NOT NULL,
    min_age integer NULL,
    applicant_type_id integer NULL,
    program_type_id uuid NULL,
    university_id uuid NULL,
    date_modified timestamp without time zone NOT NULL,
    effective_from timestamp without time zone NULL,
    deactivated_on timestamp without time zone NULL,
    CONSTRAINT pk_programs PRIMARY KEY (program_id),
    CONSTRAINT fk_programs__program_types_program_type_id FOREIGN KEY (program_type_id) REFERENCES program_types (program_type_id) ON DELETE RESTRICT,
    CONSTRAINT fk_programs__universities_university_id FOREIGN KEY (university_id) REFERENCES universities (university_id) ON DELETE RESTRICT
);

CREATE TABLE program_discipline (
    program_discipline_id uuid NOT NULL,
    discipline_id uuid NOT NULL,
    program_id uuid NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    CONSTRAINT pk_program_discipline PRIMARY KEY (program_discipline_id),
    CONSTRAINT fk_program_discipline_disciplines_discipline_id FOREIGN KEY (discipline_id) REFERENCES disciplines (discipline_id) ON DELETE CASCADE,
    CONSTRAINT fk_program_discipline_programs_program_id FOREIGN KEY (program_id) REFERENCES programs (program_id) ON DELETE CASCADE
);

CREATE INDEX ix_program_discipline_discipline_id ON program_discipline (discipline_id);

CREATE INDEX ix_program_discipline_program_id ON program_discipline (program_id);

CREATE INDEX ix_programs_program_type_id ON programs (program_type_id);

CREATE INDEX ix_programs_university_id ON programs (university_id);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20191107134203_initial-create', '2.2.6-servicing-10079');

