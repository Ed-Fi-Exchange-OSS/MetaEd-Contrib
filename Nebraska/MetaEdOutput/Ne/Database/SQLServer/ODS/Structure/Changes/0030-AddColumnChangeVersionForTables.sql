
-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[ne].[AssessmentAdministration]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [ne].[AssessmentAdministration] ADD [ChangeVersion] [BIGINT] CONSTRAINT AssessmentAdministration_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [ne].[AssessmentAdministration] DROP CONSTRAINT AssessmentAdministration_DF_ChangeVersion;
ALTER TABLE [ne].[AssessmentAdministration] ADD CONSTRAINT AssessmentAdministration_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[ne].[CrisisDetails]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [ne].[CrisisDetails] ADD [ChangeVersion] [BIGINT] CONSTRAINT CrisisDetails_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [ne].[CrisisDetails] DROP CONSTRAINT CrisisDetails_DF_ChangeVersion;
ALTER TABLE [ne].[CrisisDetails] ADD CONSTRAINT CrisisDetails_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[ne].[PostGraduateActivity]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [ne].[PostGraduateActivity] ADD [ChangeVersion] [BIGINT] CONSTRAINT PostGraduateActivity_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [ne].[PostGraduateActivity] DROP CONSTRAINT PostGraduateActivity_DF_ChangeVersion;
ALTER TABLE [ne].[PostGraduateActivity] ADD CONSTRAINT PostGraduateActivity_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


