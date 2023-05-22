IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'tracked_changes_edfixcrdc')
EXEC sys.sp_executesql N'CREATE SCHEMA [tracked_changes_edfixcrdc]'
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_edfixcrdc].[ClassGroup]'))
CREATE TABLE [tracked_changes_edfixcrdc].[ClassGroup]
(
       OldClassGroupName [NVARCHAR](75) NOT NULL,
       OldCommunityProviderId [INT] NOT NULL,
       OldCommunityProviderLocationId [INT] NOT NULL,
       OldSpecialNeedsProvidedIndicator [BIT] NOT NULL,
       NewClassGroupName [NVARCHAR](75) NULL,
       NewCommunityProviderId [INT] NULL,
       NewCommunityProviderLocationId [INT] NULL,
       NewSpecialNeedsProvidedIndicator [BIT] NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_ClassGroup PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_edfixcrdc].[CommunityProviderLocation]'))
CREATE TABLE [tracked_changes_edfixcrdc].[CommunityProviderLocation]
(
       OldCommunityProviderId [INT] NOT NULL,
       OldCommunityProviderLocationId [INT] NOT NULL,
       NewCommunityProviderId [INT] NULL,
       NewCommunityProviderLocationId [INT] NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_CommunityProviderLocation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_edfixcrdc].[StudentClassGroupAssociation]'))
CREATE TABLE [tracked_changes_edfixcrdc].[StudentClassGroupAssociation]
(
       OldBeginDate [DATE] NOT NULL,
       OldClassGroupName [NVARCHAR](75) NOT NULL,
       OldCommunityProviderId [INT] NOT NULL,
       OldCommunityProviderLocationId [INT] NOT NULL,
       OldSpecialNeedsProvidedIndicator [BIT] NOT NULL,
       OldStudentUSI [INT] NOT NULL,
       OldStudentUniqueId [NVARCHAR](32) NOT NULL,
       NewBeginDate [DATE] NULL,
       NewClassGroupName [NVARCHAR](75) NULL,
       NewCommunityProviderId [INT] NULL,
       NewCommunityProviderLocationId [INT] NULL,
       NewSpecialNeedsProvidedIndicator [BIT] NULL,
       NewStudentUSI [INT] NULL,
       NewStudentUniqueId [NVARCHAR](32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_StudentClassGroupAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_edfixcrdc].[StudentCommunityProviderLocationAssociation]'))
CREATE TABLE [tracked_changes_edfixcrdc].[StudentCommunityProviderLocationAssociation]
(
       OldBeginDate [DATE] NOT NULL,
       OldCommunityProviderId [INT] NOT NULL,
       OldCommunityProviderLocationId [INT] NOT NULL,
       OldStudentUSI [INT] NOT NULL,
       OldStudentUniqueId [NVARCHAR](32) NOT NULL,
       NewBeginDate [DATE] NULL,
       NewCommunityProviderId [INT] NULL,
       NewCommunityProviderLocationId [INT] NULL,
       NewStudentUSI [INT] NULL,
       NewStudentUniqueId [NVARCHAR](32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_StudentCommunityProviderLocationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)
