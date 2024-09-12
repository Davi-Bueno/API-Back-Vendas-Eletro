# API Venda Eletrodomésticos

Esta é uma API backend para gerenciamento de vendas de eletrodomésticos.

## Tecnologias

- Node.js
- Express.js
- Prisma ORM
- SQL Server
- Swagger para documentação da API
- JWT para autenticação

## Configuração

1. Clone o repositório
2. Instale as dependências: `npm install`
3. Configure suas variáveis de ambiente em um arquivo `.env`, incluindo `DATABASE_URL` e `SECRET`
4. Execute as migrações do banco de dados: `npx prisma migrate dev`
5. Inicie o servidor: `npm start`

## Documentação da API

Acesse a documentação Swagger em `/api-docs` quando o servidor estiver em execução.

## Autenticação

- Use `/login` para obter um token JWT
- Inclua o token no cabeçalho Authorization para rotas protegidas
- Use `/logout` para invalidar o token

## Principais Funcionalidades

- Operações CRUD para:
  - Eletrodomésticos
  - Vendedores
  - Clientes
  - Carrinhos
  - CarrinhoEletro (Itens do Carrinho)

## Estrutura do Projeto

- [ ] **Raiz**
    - .gitignore
    - app.js
    - estrutura.txt
    - README.md
    - .swagger
    - .prisma
- [ ] **Controller**
    - authController.js
    - carrinho.js
    - carrinhoEletro.js
    - cliente.js
    - eletrodomesticos.js
    - vendedor.js
- [ ] **Route**
    - carrinhoEletroRoutes.js
    - carrinhoRoutes.js
    - clientesRoutes.js
    - eletroRoutes.js
    - home.js
    - vendedorRoutes.js
- [ ] **Utils**
    - dateUtils.js
- [ ] **Views**
    - index.ejs

## Segurança

- Autenticação JWT
- Gerenciamento de sessão
- Lista negra de tokens para logout

## Views

Uma view EJS simples está incluída para a página inicial, exibindo um link para a documentação Swagger.

## A Implementar

- [ ] **Testes**
    - Implementar testes unitários e de integração com Jest

- [ ] **Perfis de Usuário**
    - Implementar perfis de usuário e gerenciamento de permissões
