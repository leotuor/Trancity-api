Criar um arquivo .env e inserir o seguinte bloco de texto: 
  POSTGRES_HOST=localhost
  POSTGRES_DB=trancity-db
  POSTGRES_USERNAME=postgres
  POSTGRES_PASSWORD=unochapeco
  POSTGRES_PORT=5432
  TOKEN_KEY=trancity-api
  API_PORT=3333
  API_HOST=http://localhost

Instalar dependências:
  npm i

Instalar jsonwebtoken e bcrypt
  npm install jsonwebtoken
  npm install bcrypt

Após instalar dependências rodar o comando:
  npm run dev