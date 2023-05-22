DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'classgroup') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.classgroup
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'communityproviderlocation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.communityproviderlocation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'studentclassgroupassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.studentclassgroupassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'edfixcrdc' AND event_object_table = 'studentcommunityproviderlocationassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixcrdc.studentcommunityproviderlocationassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
