-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='ne' AND table_name='assessmentadministration' AND column_name='changeversion') THEN
ALTER TABLE ne.AssessmentAdministration ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE ne.AssessmentAdministration ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='ne' AND table_name='crisisdetails' AND column_name='changeversion') THEN
ALTER TABLE ne.CrisisDetails ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE ne.CrisisDetails ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='ne' AND table_name='postgraduateactivity' AND column_name='changeversion') THEN
ALTER TABLE ne.PostGraduateActivity ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE ne.PostGraduateActivity ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

END
$$;
