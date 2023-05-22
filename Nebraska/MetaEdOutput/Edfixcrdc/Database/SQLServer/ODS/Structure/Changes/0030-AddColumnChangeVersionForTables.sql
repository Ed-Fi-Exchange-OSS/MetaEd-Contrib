
-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[edfixcrdc].[ClassGroup]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [edfixcrdc].[ClassGroup] ADD [ChangeVersion] [BIGINT] CONSTRAINT ClassGroup_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [edfixcrdc].[ClassGroup] DROP CONSTRAINT ClassGroup_DF_ChangeVersion;
ALTER TABLE [edfixcrdc].[ClassGroup] ADD CONSTRAINT ClassGroup_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[edfixcrdc].[CommunityProviderLocation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ADD [ChangeVersion] [BIGINT] CONSTRAINT CommunityProviderLocation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] DROP CONSTRAINT CommunityProviderLocation_DF_ChangeVersion;
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ADD CONSTRAINT CommunityProviderLocation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[edfixcrdc].[StudentClassGroupAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentClassGroupAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] DROP CONSTRAINT StudentClassGroupAssociation_DF_ChangeVersion;
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ADD CONSTRAINT StudentClassGroupAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[edfixcrdc].[StudentCommunityProviderLocationAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentCommunityProviderLocationAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] DROP CONSTRAINT StudentCommunityProviderLocationAssociation_DF_ChangeVersion;
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ADD CONSTRAINT StudentCommunityProviderLocationAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


