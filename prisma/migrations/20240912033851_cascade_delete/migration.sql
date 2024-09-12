BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[tbl_Carrinho] (
    [ID_Carrinho] INT NOT NULL IDENTITY(1,1),
    [data_criacao] DATETIME2 NOT NULL,
    [ID_Cliente] INT NOT NULL,
    [ID_Vendedor] INT NOT NULL,
    CONSTRAINT [tbl_Carrinho_pkey] PRIMARY KEY CLUSTERED ([ID_Carrinho])
);

-- CreateTable
CREATE TABLE [dbo].[tbl_Carrinho_Eletro] (
    [ID_Carrinho] INT NOT NULL,
    [ID_Eletro] INT NOT NULL,
    [quantidade] INT NOT NULL,
    CONSTRAINT [tbl_Carrinho_Eletro_pkey] PRIMARY KEY CLUSTERED ([ID_Carrinho],[ID_Eletro])
);

-- CreateTable
CREATE TABLE [dbo].[tbl_Cliente] (
    [ID_Cliente] INT NOT NULL IDENTITY(1,1),
    [nome] NVARCHAR(1000) NOT NULL,
    [contato] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [CPF] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [tbl_Cliente_pkey] PRIMARY KEY CLUSTERED ([ID_Cliente])
);

-- CreateTable
CREATE TABLE [dbo].[tbl_Eletrodomesticos] (
    [ID_Eletro] INT NOT NULL IDENTITY(1,1),
    [eletrodomestico] NVARCHAR(1000) NOT NULL,
    [valor] FLOAT(53) NOT NULL,
    [ID_Vendedor] INT NOT NULL,
    CONSTRAINT [tbl_Eletrodomesticos_pkey] PRIMARY KEY CLUSTERED ([ID_Eletro])
);

-- CreateTable
CREATE TABLE [dbo].[tbl_Vendedor] (
    [ID_Vendedor] INT NOT NULL IDENTITY(1,1),
    [nome] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [tbl_Vendedor_pkey] PRIMARY KEY CLUSTERED ([ID_Vendedor])
);

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] ADD CONSTRAINT [tbl_Carrinho_ID_Cliente_fkey] FOREIGN KEY ([ID_Cliente]) REFERENCES [dbo].[tbl_Cliente]([ID_Cliente]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] ADD CONSTRAINT [tbl_Carrinho_ID_Vendedor_fkey] FOREIGN KEY ([ID_Vendedor]) REFERENCES [dbo].[tbl_Vendedor]([ID_Vendedor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] ADD CONSTRAINT [tbl_Carrinho_Eletro_ID_Carrinho_fkey] FOREIGN KEY ([ID_Carrinho]) REFERENCES [dbo].[tbl_Carrinho]([ID_Carrinho]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] ADD CONSTRAINT [tbl_Carrinho_Eletro_ID_Eletro_fkey] FOREIGN KEY ([ID_Eletro]) REFERENCES [dbo].[tbl_Eletrodomesticos]([ID_Eletro]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Eletrodomesticos] ADD CONSTRAINT [tbl_Eletrodomesticos_ID_Vendedor_fkey] FOREIGN KEY ([ID_Vendedor]) REFERENCES [dbo].[tbl_Vendedor]([ID_Vendedor]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
