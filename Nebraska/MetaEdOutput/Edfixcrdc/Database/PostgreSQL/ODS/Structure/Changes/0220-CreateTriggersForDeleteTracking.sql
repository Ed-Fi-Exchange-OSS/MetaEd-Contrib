DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.alternativestatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.AlternativeStatusDescriptorId, b.codevalue, b.namespace, b.id, 'edfixcrdc.AlternativeStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.AlternativeStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'alternativestatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.alternativestatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.alternativestatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.classgroup_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfixcrdc.classgroup(
        oldclassgroupname, oldcommunityproviderid, oldcommunityproviderlocationid, oldspecialneedsprovidedindicator,
        id, discriminator, changeversion)
    VALUES (
        OLD.classgroupname, OLD.communityproviderid, OLD.communityproviderlocationid, OLD.specialneedsprovidedindicator, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'classgroup') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.classgroup 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.classgroup_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.communityproviderlocation_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfixcrdc.communityproviderlocation(
        oldcommunityproviderid, oldcommunityproviderlocationid,
        id, discriminator, changeversion)
    VALUES (
        OLD.communityproviderid, OLD.communityproviderlocationid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'communityproviderlocation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.communityproviderlocation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.communityproviderlocation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.meetingdaydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.MeetingDayDescriptorId, b.codevalue, b.namespace, b.id, 'edfixcrdc.MeetingDayDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.MeetingDayDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'meetingdaydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.meetingdaydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.meetingdaydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.programcostdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ProgramCostDescriptorId, b.codevalue, b.namespace, b.id, 'edfixcrdc.ProgramCostDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ProgramCostDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'programcostdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.programcostdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.programcostdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.restraintcategorydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RestraintCategoryDescriptorId, b.codevalue, b.namespace, b.id, 'edfixcrdc.RestraintCategoryDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RestraintCategoryDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'restraintcategorydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.restraintcategorydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.restraintcategorydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.studentclassgroupassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_edfixcrdc.studentclassgroupassociation(
        oldbegindate, oldclassgroupname, oldcommunityproviderid, oldcommunityproviderlocationid, oldspecialneedsprovidedindicator, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.classgroupname, OLD.communityproviderid, OLD.communityproviderlocationid, OLD.specialneedsprovidedindicator, OLD.studentusi, dj0.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'studentclassgroupassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.studentclassgroupassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.studentclassgroupassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.studentcommunityproviderlocationassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_edfixcrdc.studentcommunityproviderlocationassociation(
        oldbegindate, oldcommunityproviderid, oldcommunityproviderlocationid, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.communityproviderid, OLD.communityproviderlocationid, OLD.studentusi, dj0.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'studentcommunityproviderlocationassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.studentcommunityproviderlocationassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.studentcommunityproviderlocationassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixcrdc.ungradeddetaildescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.UngradedDetailDescriptorId, b.codevalue, b.namespace, b.id, 'edfixcrdc.UngradedDetailDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.UngradedDetailDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'ungradeddetaildescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixcrdc.ungradeddetaildescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixcrdc.ungradeddetaildescriptor_deleted();
END IF;

END
$$;
