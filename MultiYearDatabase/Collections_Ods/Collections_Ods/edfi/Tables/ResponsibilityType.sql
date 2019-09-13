﻿CREATE TABLE [edfi].[ResponsibilityType] (
    [ResponsibilityTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (50)    NOT NULL,
    [ShortDescription]     NVARCHAR (450)   NOT NULL,
    [Description]          NVARCHAR (1024)  NOT NULL,
    [Id]                   UNIQUEIDENTIFIER CONSTRAINT [ResponsibilityType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]     DATETIME         CONSTRAINT [ResponsibilityType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]           DATETIME         CONSTRAINT [ResponsibilityType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ResponsibilityType] PRIMARY KEY CLUSTERED ([ResponsibilityTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ResponsibilityType_ShortDescription]
    ON [edfi].[ResponsibilityType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_ResponsibilityType]
    ON [edfi].[ResponsibilityType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indications of an education organization''s responsibility for a student, such as accountability, attendance, funding, etc.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityType', @level2type = N'COLUMN', @level2name = N'ResponsibilityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResponsibilityType', @level2type = N'COLUMN', @level2name = N'Description';
