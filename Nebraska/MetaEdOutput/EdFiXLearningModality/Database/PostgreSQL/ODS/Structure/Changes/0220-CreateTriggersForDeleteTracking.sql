DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_edfixlearningmodality.modalitytimetypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ModalityTimeTypeDescriptorId, b.codevalue, b.namespace, b.id, 'edfixlearningmodality.ModalityTimeTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ModalityTimeTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixlearningmodality' AND event_object_table = 'modalitytimetypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixlearningmodality.modalitytimetypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixlearningmodality.modalitytimetypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_edfixlearningmodality.modalitytypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ModalityTypeDescriptorId, b.codevalue, b.namespace, b.id, 'edfixlearningmodality.ModalityTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ModalityTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'edfixlearningmodality' AND event_object_table = 'modalitytypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixlearningmodality.modalitytypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_edfixlearningmodality.modalitytypedescriptor_deleted();
END IF;

END
$$;
