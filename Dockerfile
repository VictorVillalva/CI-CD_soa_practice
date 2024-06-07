# Usar una imagen base oficial de Node.js
FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm install

# Si estás construyendo para producción
# RUN npm ci --only=production

# Copiar el código de la aplicación al contenedor
COPY . .

# Exponer el puerto en el que la aplicación va a correr
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]