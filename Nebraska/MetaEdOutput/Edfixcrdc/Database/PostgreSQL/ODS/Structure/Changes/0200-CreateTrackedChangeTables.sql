DO $$
BEGIN

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'tracked_changes_edfixcrdc') THEN
CREATE SCHEMA tracked_changes_edfixcrdc;
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_edfixcrdc' AND table_name = 'classgroup') THEN
CREATE TABLE tracked_changes_edfixcrdc.classgroup
(
       oldclassgroupname VARCHAR(75) NOT NULL,
       oldcommunityproviderid INT NOT NULL,
       oldcommunityproviderlocationid INT NOT NULL,
       oldspecialneedsprovidedindicator BOOLEAN NOT NULL,
       newclassgroupname VARCHAR(75) NULL,
       newcommunityproviderid INT NULL,
       newcommunityproviderlocationid INT NULL,
       newspecialneedsprovidedindicator BOOLEAN NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT classgroup_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_edfixcrdc' AND table_name = 'communityproviderlocation') THEN
CREATE TABLE tracked_changes_edfixcrdc.communityproviderlocation
(
       oldcommunityproviderid INT NOT NULL,
       oldcommunityproviderlocationid INT NOT NULL,
       newcommunityproviderid INT NULL,
       newcommunityproviderlocationid INT NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT communityproviderlocation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_edfixcrdc' AND table_name = 'studentclassgroupassociation') THEN
CREATE TABLE tracked_changes_edfixcrdc.studentclassgroupassociation
(
       oldbegindate DATE NOT NULL,
       oldclassgroupname VARCHAR(75) NOT NULL,
       oldcommunityproviderid INT NOT NULL,
       oldcommunityproviderlocationid INT NOT NULL,
       oldspecialneedsprovidedindicator BOOLEAN NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       newclassgroupname VARCHAR(75) NULL,
       newcommunityproviderid INT NULL,
       newcommunityproviderlocationid INT NULL,
       newspecialneedsprovidedindicator BOOLEAN NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studentclassgroupassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_edfixcrdc' AND table_name = 'studentcommunityproviderlocationassociation') THEN
CREATE TABLE tracked_changes_edfixcrdc.studentcommunityproviderlocationassociation
(
       oldbegindate DATE NOT NULL,
       oldcommunityproviderid INT NOT NULL,
       oldcommunityproviderlocationid INT NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       newcommunityproviderid INT NULL,
       newcommunityproviderlocationid INT NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studentcommunityproviderlocationassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

END
$$;
