# Frontend

UI for sample distributed TODO application.

## Configuration
- `PORT` - a port the application binds to 
- `AUTH_API_ADDRESS` - address of `auth-api` for authentication
- `TODOS_API_ADDRESS` - address of `todos-api` for TODO CRUD

## Building

``` bash
# install dependencies
npm install

# build application
npm run build
```

## Running

``` bash
PORT=8080 AUTH_API_ADDRESS=http://127.0.0.1:8000 TODOS_API_ADDRESS=http://127.0.0.1:8082 npm start
```

## Dependencies
Here you can find the software required to run this microservice, as well as the version we have tested. 
|  Dependency | Version  |
|-------------|----------|
| Node        | 8.17.0   |
| NPM         | 6.13.4   |



# Documentación de Cambios – Microservicio `ms-frontend`

## 🐳 Contenerización

Se creó un Dockerfile que permite construir una imagen del frontend del microservicio utilizando una imagen base de Node.js. El proceso instala dependencias, compila la aplicación y la prepara para ejecutarse sobre el puerto 8080.

También se definieron variables de entorno necesarias para permitir la comunicación con otros microservicios como `authapi` y `todosapi`.

---

## ☸️ Despliegue en Kubernetes

Se añadieron dos archivos de manifiesto para Kubernetes:

- **Deployment:** define el despliegue del microservicio `frontend`, especificando el uso de una imagen almacenada en Azure Container Registry y exponiendo el puerto de la aplicación.

- **Service:** permite exponer el microservicio al exterior del clúster mediante un `LoadBalancer`, redirigiendo tráfico del puerto 80 al puerto interno del contenedor.

---

## 🔁 Automatización CI/CD con GitHub Actions

Se integró un flujo CI/CD que se ejecuta automáticamente al hacer *push* en la rama `main`. Este flujo realiza lo siguiente:

1. Autenticación en Azure y en el registro de contenedores.
2. Construcción de la imagen Docker del frontend.
3. Publicación de la imagen en Azure Container Registry con tags `latest` y el hash del commit.
4. Aplicación de los manifiestos de Kubernetes para actualizar el despliegue.
5. Reasignación de la imagen actualizada al Deployment.
6. Obtención automática de la IP pública asignada por el servicio LoadBalancer.

Esto permite realizar despliegues consistentes, automáticos y trazables.

---

## 📣 Notificación en Slack

Se incorporó un flujo adicional que notifica al canal de Slack cada vez que se detecta un *push* a la rama `main`. Esta notificación informa al equipo que se han realizado cambios en el repositorio del microservicio `ms-frontend`.

