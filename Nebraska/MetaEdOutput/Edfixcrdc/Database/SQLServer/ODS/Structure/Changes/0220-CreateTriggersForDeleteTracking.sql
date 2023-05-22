DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_AlternativeStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_AlternativeStatusDescriptor_TR_DeleteTracking] ON [edfixcrdc].[AlternativeStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AlternativeStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'edfixcrdc.AlternativeStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AlternativeStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[AlternativeStatusDescriptor] ENABLE TRIGGER [edfixcrdc_AlternativeStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_ClassGroup_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_ClassGroup_TR_DeleteTracking] ON [edfixcrdc].[ClassGroup] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfixcrdc].[ClassGroup](OldClassGroupName, OldCommunityProviderId, OldCommunityProviderLocationId, OldSpecialNeedsProvidedIndicator, Id, Discriminator, ChangeVersion)
    SELECT d.ClassGroupName, d.CommunityProviderId, d.CommunityProviderLocationId, d.SpecialNeedsProvidedIndicator, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[ClassGroup] ENABLE TRIGGER [edfixcrdc_ClassGroup_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_CommunityProviderLocation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_CommunityProviderLocation_TR_DeleteTracking] ON [edfixcrdc].[CommunityProviderLocation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfixcrdc].[CommunityProviderLocation](OldCommunityProviderId, OldCommunityProviderLocationId, Id, Discriminator, ChangeVersion)
    SELECT d.CommunityProviderId, d.CommunityProviderLocationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ENABLE TRIGGER [edfixcrdc_CommunityProviderLocation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_MeetingDayDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_MeetingDayDescriptor_TR_DeleteTracking] ON [edfixcrdc].[MeetingDayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.MeetingDayDescriptorId, b.CodeValue, b.Namespace, b.Id, 'edfixcrdc.MeetingDayDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MeetingDayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[MeetingDayDescriptor] ENABLE TRIGGER [edfixcrdc_MeetingDayDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_ProgramCostDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_ProgramCostDescriptor_TR_DeleteTracking] ON [edfixcrdc].[ProgramCostDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ProgramCostDescriptorId, b.CodeValue, b.Namespace, b.Id, 'edfixcrdc.ProgramCostDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramCostDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[ProgramCostDescriptor] ENABLE TRIGGER [edfixcrdc_ProgramCostDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_RestraintCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_RestraintCategoryDescriptor_TR_DeleteTracking] ON [edfixcrdc].[RestraintCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RestraintCategoryDescriptorId, b.CodeValue, b.Namespace, b.Id, 'edfixcrdc.RestraintCategoryDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[RestraintCategoryDescriptor] ENABLE TRIGGER [edfixcrdc_RestraintCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_StudentClassGroupAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentClassGroupAssociation_TR_DeleteTracking] ON [edfixcrdc].[StudentClassGroupAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfixcrdc].[StudentClassGroupAssociation](OldBeginDate, OldClassGroupName, OldCommunityProviderId, OldCommunityProviderLocationId, OldSpecialNeedsProvidedIndicator, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.ClassGroupName, d.CommunityProviderId, d.CommunityProviderLocationId, d.SpecialNeedsProvidedIndicator, d.StudentUSI, j0.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j0
            ON d.StudentUSI = j0.StudentUSI
END
GO

ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ENABLE TRIGGER [edfixcrdc_StudentClassGroupAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_StudentCommunityProviderLocationAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_StudentCommunityProviderLocationAssociation_TR_DeleteTracking] ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfixcrdc].[StudentCommunityProviderLocationAssociation](OldBeginDate, OldCommunityProviderId, OldCommunityProviderLocationId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.CommunityProviderId, d.CommunityProviderLocationId, d.StudentUSI, j0.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j0
            ON d.StudentUSI = j0.StudentUSI
END
GO

ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ENABLE TRIGGER [edfixcrdc_StudentCommunityProviderLocationAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfixcrdc].[edfixcrdc_UngradedDetailDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfixcrdc].[edfixcrdc_UngradedDetailDescriptor_TR_DeleteTracking] ON [edfixcrdc].[UngradedDetailDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.UngradedDetailDescriptorId, b.CodeValue, b.Namespace, b.Id, 'edfixcrdc.UngradedDetailDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.UngradedDetailDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixcrdc].[UngradedDetailDescriptor] ENABLE TRIGGER [edfixcrdc_UngradedDetailDescriptor_TR_DeleteTracking]
GO


