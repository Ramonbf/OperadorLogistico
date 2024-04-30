IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [TB_ENTREGADORES] (
    [Id] int NOT NULL IDENTITY,
    [Nome] varchar(200) NOT NULL,
    [SobreNome] varchar(200) NOT NULL,
    [Cpf] varchar(200) NOT NULL,
    [Cnpj] varchar(200) NOT NULL,
    [TipodepracaEnum] int NOT NULL,
    [TipodeturnosEnum] int NOT NULL,
    CONSTRAINT [PK_TB_ENTREGADORES] PRIMARY KEY ([Id])
);
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Cnpj', N'Cpf', N'Nome', N'SobreNome', N'TipodepracaEnum', N'TipodeturnosEnum') AND [object_id] = OBJECT_ID(N'[TB_ENTREGADORES]'))
    SET IDENTITY_INSERT [TB_ENTREGADORES] ON;
INSERT INTO [TB_ENTREGADORES] ([Id], [Cnpj], [Cpf], [Nome], [SobreNome], [TipodepracaEnum], [TipodeturnosEnum])
VALUES (1, '45.123.758/0001-65', '423.578.584-52', 'Rodrigo', 'Borges', 10, 7),
(2, '45.185.258/0001-58', '158.489.985-22', 'Felipe', 'Aquino', 12, 3),
(3, '14.215.155/0001-44', '258.568.548-57', 'Aliston', 'Santos', 9, 2),
(4, '48.859.858/0001-69', '785.486.985-89', 'douglas', 'ferreira', 3, 2),
(5, '45.198.405/001-65', '445.220.368-88', 'Ramon', 'Borges', 8, 4);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Cnpj', N'Cpf', N'Nome', N'SobreNome', N'TipodepracaEnum', N'TipodeturnosEnum') AND [object_id] = OBJECT_ID(N'[TB_ENTREGADORES]'))
    SET IDENTITY_INSERT [TB_ENTREGADORES] OFF;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240429200233_InitialCreate', N'8.0.4');
GO

COMMIT;
GO

