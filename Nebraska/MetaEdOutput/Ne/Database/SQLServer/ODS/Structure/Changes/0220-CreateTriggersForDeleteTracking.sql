DROP TRIGGER IF EXISTS [ne].[ne_AssessmentAdministration_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_AssessmentAdministration_TR_DeleteTracking] ON [ne].[AssessmentAdministration] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_ne].[AssessmentAdministration](OldAssessmentIdentifier, OldEducationOrganizationId, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT d.AssessmentIdentifier, d.EducationOrganizationId, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [ne].[AssessmentAdministration] ENABLE TRIGGER [ne_AssessmentAdministration_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_CrisisDetails_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_CrisisDetails_TR_DeleteTracking] ON [ne].[CrisisDetails] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_ne].[CrisisDetails](OldCrisisEventDescriptorId, OldCrisisEventDescriptorNamespace, OldCrisisEventDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.CrisisEventDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.CrisisEventDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [ne].[CrisisDetails] ENABLE TRIGGER [ne_CrisisDetails_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_CrisisEventDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_CrisisEventDescriptor_TR_DeleteTracking] ON [ne].[CrisisEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CrisisEventDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.CrisisEventDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[CrisisEventDescriptor] ENABLE TRIGGER [ne_CrisisEventDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_CrisisTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_CrisisTypeDescriptor_TR_DeleteTracking] ON [ne].[CrisisTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CrisisTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.CrisisTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[CrisisTypeDescriptor] ENABLE TRIGGER [ne_CrisisTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_DualCreditDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_DualCreditDescriptor_TR_DeleteTracking] ON [ne].[DualCreditDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.DualCreditDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.DualCreditDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DualCreditDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[DualCreditDescriptor] ENABLE TRIGGER [ne_DualCreditDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_EarlyLearningSettingDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_EarlyLearningSettingDescriptor_TR_DeleteTracking] ON [ne].[EarlyLearningSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EarlyLearningSettingDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.EarlyLearningSettingDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyLearningSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[EarlyLearningSettingDescriptor] ENABLE TRIGGER [ne_EarlyLearningSettingDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_ImmigrantIndicatorDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_ImmigrantIndicatorDescriptor_TR_DeleteTracking] ON [ne].[ImmigrantIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ImmigrantIndicatorDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.ImmigrantIndicatorDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ImmigrantIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[ImmigrantIndicatorDescriptor] ENABLE TRIGGER [ne_ImmigrantIndicatorDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PartCTransitionDelayReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PartCTransitionDelayReasonDescriptor_TR_DeleteTracking] ON [ne].[PartCTransitionDelayReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PartCTransitionDelayReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.PartCTransitionDelayReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PartCTransitionDelayReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PartCTransitionDelayReasonDescriptor] ENABLE TRIGGER [ne_PartCTransitionDelayReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PlacementTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PlacementTypeDescriptor_TR_DeleteTracking] ON [ne].[PlacementTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PlacementTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.PlacementTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PlacementTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PlacementTypeDescriptor] ENABLE TRIGGER [ne_PlacementTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PositionTitleDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PositionTitleDescriptor_TR_DeleteTracking] ON [ne].[PositionTitleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PositionTitleDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.PositionTitleDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PositionTitleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PositionTitleDescriptor] ENABLE TRIGGER [ne_PositionTitleDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PostGraduateActivity_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PostGraduateActivity_TR_DeleteTracking] ON [ne].[PostGraduateActivity] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_ne].[PostGraduateActivity](OldLocalEducationAgencyId, OldSchoolYear, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.LocalEducationAgencyId, d.SchoolYear, d.StudentUSI, j0.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j0
            ON d.StudentUSI = j0.StudentUSI
END
GO

ALTER TABLE [ne].[PostGraduateActivity] ENABLE TRIGGER [ne_PostGraduateActivity_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PostGraduateActivityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PostGraduateActivityDescriptor_TR_DeleteTracking] ON [ne].[PostGraduateActivityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PostGraduateActivityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.PostGraduateActivityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PostGraduateActivityDescriptor] ENABLE TRIGGER [ne_PostGraduateActivityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking] ON [ne].[PostGraduateActivityDeterminationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PostGraduateActivityDeterminationDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.PostGraduateActivityDeterminationDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDeterminationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PostGraduateActivityDeterminationDescriptor] ENABLE TRIGGER [ne_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_SectionDeliveryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_SectionDeliveryDescriptor_TR_DeleteTracking] ON [ne].[SectionDeliveryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SectionDeliveryDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.SectionDeliveryDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionDeliveryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[SectionDeliveryDescriptor] ENABLE TRIGGER [ne_SectionDeliveryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_SpecialEducationProgramDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_SpecialEducationProgramDescriptor_TR_DeleteTracking] ON [ne].[SpecialEducationProgramDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationProgramDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.SpecialEducationProgramDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationProgramDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[SpecialEducationProgramDescriptor] ENABLE TRIGGER [ne_SpecialEducationProgramDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [ne].[ne_UnilateralRemovalDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [ne].[ne_UnilateralRemovalDescriptor_TR_DeleteTracking] ON [ne].[UnilateralRemovalDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.UnilateralRemovalDescriptorId, b.CodeValue, b.Namespace, b.Id, 'ne.UnilateralRemovalDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.UnilateralRemovalDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[UnilateralRemovalDescriptor] ENABLE TRIGGER [ne_UnilateralRemovalDescriptor_TR_DeleteTracking]
GO


