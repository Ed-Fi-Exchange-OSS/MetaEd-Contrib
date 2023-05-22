DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_ne.assessmentadministration_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_ne.assessmentadministration(
        oldassessmentidentifier, oldeducationorganizationid, oldnamespace,
        id, discriminator, changeversion)
    VALUES (
        OLD.assessmentidentifier, OLD.educationorganizationid, OLD.namespace, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'assessmentadministration') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.assessmentadministration 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.assessmentadministration_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.crisisdetails_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.crisiseventdescriptorid;

    INSERT INTO tracked_changes_ne.crisisdetails(
        oldcrisiseventdescriptorid, oldcrisiseventdescriptornamespace, oldcrisiseventdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.crisiseventdescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'crisisdetails') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.crisisdetails 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.crisisdetails_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.crisiseventdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CrisisEventDescriptorId, b.codevalue, b.namespace, b.id, 'ne.CrisisEventDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CrisisEventDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'crisiseventdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.crisiseventdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.crisiseventdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.crisistypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CrisisTypeDescriptorId, b.codevalue, b.namespace, b.id, 'ne.CrisisTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CrisisTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'crisistypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.crisistypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.crisistypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.dualcreditdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.DualCreditDescriptorId, b.codevalue, b.namespace, b.id, 'ne.DualCreditDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.DualCreditDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'dualcreditdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.dualcreditdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.dualcreditdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.earlylearningsettingdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EarlyLearningSettingDescriptorId, b.codevalue, b.namespace, b.id, 'ne.EarlyLearningSettingDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EarlyLearningSettingDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'earlylearningsettingdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.earlylearningsettingdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.earlylearningsettingdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.immigrantindicatordescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ImmigrantIndicatorDescriptorId, b.codevalue, b.namespace, b.id, 'ne.ImmigrantIndicatorDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ImmigrantIndicatorDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'immigrantindicatordescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.immigrantindicatordescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.immigrantindicatordescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.partctransitiondelayreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PartCTransitionDelayReasonDescriptorId, b.codevalue, b.namespace, b.id, 'ne.PartCTransitionDelayReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PartCTransitionDelayReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'partctransitiondelayreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.partctransitiondelayreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.partctransitiondelayreasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.placementtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PlacementTypeDescriptorId, b.codevalue, b.namespace, b.id, 'ne.PlacementTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PlacementTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'placementtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.placementtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.placementtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.positiontitledescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PositionTitleDescriptorId, b.codevalue, b.namespace, b.id, 'ne.PositionTitleDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PositionTitleDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'positiontitledescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.positiontitledescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.positiontitledescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.postgraduateactivity_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_ne.postgraduateactivity(
        oldlocaleducationagencyid, oldschoolyear, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.localeducationagencyid, OLD.schoolyear, OLD.studentusi, dj0.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'postgraduateactivity') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.postgraduateactivity 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.postgraduateactivity_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.postgraduateactivitydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PostGraduateActivityDescriptorId, b.codevalue, b.namespace, b.id, 'ne.PostGraduateActivityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PostGraduateActivityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'postgraduateactivitydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.postgraduateactivitydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.postgraduateactivitydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.postgraduateactivitydeterminationdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PostGraduateActivityDeterminationDescriptorId, b.codevalue, b.namespace, b.id, 'ne.PostGraduateActivityDeterminationDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PostGraduateActivityDeterminationDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'postgraduateactivitydeterminationdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.postgraduateactivitydeterminationdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.postgraduateactivitydeterminationdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.sectiondeliverydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SectionDeliveryDescriptorId, b.codevalue, b.namespace, b.id, 'ne.SectionDeliveryDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SectionDeliveryDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'sectiondeliverydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.sectiondeliverydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.sectiondeliverydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.specialeducationprogramdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationProgramDescriptorId, b.codevalue, b.namespace, b.id, 'ne.SpecialEducationProgramDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationProgramDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'specialeducationprogramdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.specialeducationprogramdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.specialeducationprogramdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_ne.unilateralremovaldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.UnilateralRemovalDescriptorId, b.codevalue, b.namespace, b.id, 'ne.UnilateralRemovalDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.UnilateralRemovalDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'ne' AND event_object_table = 'unilateralremovaldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.unilateralremovaldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_ne.unilateralremovaldescriptor_deleted();
END IF;

END
$$;
