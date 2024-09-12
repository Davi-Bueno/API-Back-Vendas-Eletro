const swaggerJsdoc = require('swagger-jsdoc');//biblio para gerar a  doc
const swaggerUi = require('swagger-ui-express');//interface do uso da doc


const swaggerOptions = {//configs
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API Venda Eletrodomésticos',
      version: '1.0.0',
      description: 'API destinado à uso de CRUDS',
    },
    components: {
      securitySchemes: {//config de segurança
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
        },
      },
    },
    security: [
      {
        bearerAuth: [],
      },
    ],
  },
  apis: ['./API-vendas/route/*.js'], // de onde ele vai puxar as ditas docs(nos routes)
};

const swaggerDocs = swaggerJsdoc(swaggerOptions);//uso das configs

module.exports = {
  swaggerUi,
  swaggerDocs,
};
