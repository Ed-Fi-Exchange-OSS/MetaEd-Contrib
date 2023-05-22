-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='edfixcrdc' AND table_name='classgroup' AND column_name='changeversion') THEN
ALTER TABLE edfixcrdc.ClassGroup ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE edfixcrdc.ClassGroup ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='edfixcrdc' AND table_name='communityproviderlocation' AND column_name='changeversion') THEN
ALTER TABLE edfixcrdc.CommunityProviderLocation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE edfixcrdc.CommunityProviderLocation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='edfixcrdc' AND table_name='studentclassgroupassociation' AND column_name='changeversion') THEN
ALTER TABLE edfixcrdc.StudentClassGroupAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE edfixcrdc.StudentClassGroupAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='edfixcrdc' AND table_name='studentcommunityproviderlocationassociation' AND column_name='changeversion') THEN
ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

END
$$;
