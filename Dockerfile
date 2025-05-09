#dokerfile para la aplicación frontend 
# Usa Node.js 8.17.0 para instalar dependencias, compilar y servir la app
# La imagen esta en DockerHub (vanesa155) y ACR para despliegue en AKS

FROM node:8.17.0

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo package.json y package-lock.json (si existe)
COPY . .

# Instalar las dependencias
RUN npm install
# Compilar la aplicación
RUN npm run build

ENV PORT=8080
ENV AUTH_API_ADDRESS=http://authapi:8000
ENV TODOS_API_ADDRESS=http://todosapi:8082

EXPOSE ${PORT}

CMD ["npm", "start"]