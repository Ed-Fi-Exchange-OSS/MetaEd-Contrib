DO $$
BEGIN

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'tracked_changes_ne') THEN
CREATE SCHEMA tracked_changes_ne;
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_ne' AND table_name = 'assessmentadministration') THEN
CREATE TABLE tracked_changes_ne.assessmentadministration
(
       oldassessmentidentifier VARCHAR(60) NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       newassessmentidentifier VARCHAR(60) NULL,
       neweducationorganizationid INT NULL,
       newnamespace VARCHAR(255) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT assessmentadministration_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_ne' AND table_name = 'crisisdetails') THEN
CREATE TABLE tracked_changes_ne.crisisdetails
(
       oldcrisiseventdescriptorid INT NOT NULL,
       oldcrisiseventdescriptornamespace VARCHAR(255) NOT NULL,
       oldcrisiseventdescriptorcodevalue VARCHAR(50) NOT NULL,
       newcrisiseventdescriptorid INT NULL,
       newcrisiseventdescriptornamespace VARCHAR(255) NULL,
       newcrisiseventdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT crisisdetails_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_ne' AND table_name = 'postgraduateactivity') THEN
CREATE TABLE tracked_changes_ne.postgraduateactivity
(
       oldlocaleducationagencyid INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newlocaleducationagencyid INT NULL,
       newschoolyear SMALLINT NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT postgraduateactivity_pk PRIMARY KEY (ChangeVersion)
);
END IF;

END
$$;
