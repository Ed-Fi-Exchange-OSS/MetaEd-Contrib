IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'tracked_changes_ne')
EXEC sys.sp_executesql N'CREATE SCHEMA [tracked_changes_ne]'
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_ne].[AssessmentAdministration]'))
CREATE TABLE [tracked_changes_ne].[AssessmentAdministration]
(
       OldAssessmentIdentifier [NVARCHAR](60) NOT NULL,
       OldEducationOrganizationId [INT] NOT NULL,
       OldNamespace [NVARCHAR](255) NOT NULL,
       NewAssessmentIdentifier [NVARCHAR](60) NULL,
       NewEducationOrganizationId [INT] NULL,
       NewNamespace [NVARCHAR](255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_AssessmentAdministration PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_ne].[CrisisDetails]'))
CREATE TABLE [tracked_changes_ne].[CrisisDetails]
(
       OldCrisisEventDescriptorId [INT] NOT NULL,
       OldCrisisEventDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldCrisisEventDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewCrisisEventDescriptorId [INT] NULL,
       NewCrisisEventDescriptorNamespace [NVARCHAR](255) NULL,
       NewCrisisEventDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_CrisisDetails PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_ne].[PostGraduateActivity]'))
CREATE TABLE [tracked_changes_ne].[PostGraduateActivity]
(
       OldLocalEducationAgencyId [INT] NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldStudentUSI [INT] NOT NULL,
       OldStudentUniqueId [NVARCHAR](32) NOT NULL,
       NewLocalEducationAgencyId [INT] NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewStudentUSI [INT] NULL,
       NewStudentUniqueId [NVARCHAR](32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_PostGraduateActivity PRIMARY KEY CLUSTERED (ChangeVersion)
)
