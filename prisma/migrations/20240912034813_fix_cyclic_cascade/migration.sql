BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] DROP CONSTRAINT [tbl_Carrinho_ID_Cliente_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] DROP CONSTRAINT [tbl_Carrinho_ID_Vendedor_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] DROP CONSTRAINT [tbl_Carrinho_Eletro_ID_Carrinho_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] DROP CONSTRAINT [tbl_Carrinho_Eletro_ID_Eletro_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[tbl_Eletrodomesticos] DROP CONSTRAINT [tbl_Eletrodomesticos_ID_Vendedor_fkey];

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] ADD CONSTRAINT [tbl_Carrinho_ID_Cliente_fkey] FOREIGN KEY ([ID_Cliente]) REFERENCES [dbo].[tbl_Cliente]([ID_Cliente]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho] ADD CONSTRAINT [tbl_Carrinho_ID_Vendedor_fkey] FOREIGN KEY ([ID_Vendedor]) REFERENCES [dbo].[tbl_Vendedor]([ID_Vendedor]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] ADD CONSTRAINT [tbl_Carrinho_Eletro_ID_Carrinho_fkey] FOREIGN KEY ([ID_Carrinho]) REFERENCES [dbo].[tbl_Carrinho]([ID_Carrinho]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Carrinho_Eletro] ADD CONSTRAINT [tbl_Carrinho_Eletro_ID_Eletro_fkey] FOREIGN KEY ([ID_Eletro]) REFERENCES [dbo].[tbl_Eletrodomesticos]([ID_Eletro]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tbl_Eletrodomesticos] ADD CONSTRAINT [tbl_Eletrodomesticos_ID_Vendedor_fkey] FOREIGN KEY ([ID_Vendedor]) REFERENCES [dbo].[tbl_Vendedor]([ID_Vendedor]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
