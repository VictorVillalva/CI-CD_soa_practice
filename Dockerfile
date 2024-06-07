# Usar una imagen base oficial de Node.js
FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar package.json y package-lock.json al directorio de trabajo
COPY package*.json ./


#Switch to root user to install dependencies
USER root

#Install app dependencies with unsafe permissions
RUN npm install --unsafe-perm

#Create a non-root user and switch to it
RUN useradd -m appuser
USER appuser

# Copiar el código de la aplicación al contenedor
COPY . .

# Exponer el puerto en el que la aplicación va a correr
EXPOSE 8081

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]