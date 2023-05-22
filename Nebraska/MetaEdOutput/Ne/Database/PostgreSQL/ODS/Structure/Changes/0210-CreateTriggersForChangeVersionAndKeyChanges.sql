DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'ne' AND event_object_table = 'assessmentadministration') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.assessmentadministration
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'ne' AND event_object_table = 'crisisdetails') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.crisisdetails
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'ne' AND event_object_table = 'postgraduateactivity') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.postgraduateactivity
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
