#!/bin/sh

npx tsc

if [ "$NODE_ENV" = "production" ]; then
  echo "NODE_ENV=production, no se ejecutan migraciones."
else
  echo "Ejecutando migraciones de la base de datos..."
  npx sequelize-cli db:migrate \
    --migrations-path dist/migrations \
    --config dist/src/config/config.js
fi

echo "Iniciando la aplicación..."
exec npm start