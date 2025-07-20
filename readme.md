Visión General

Aplicación fullstack contenerizada para gestión de tareas con autenticación Auth0. Implementa operaciones CRUD completas con arquitectura de tres capas y entorno de desarrollo unificado mediante Docker Compose.

Componentes principales:

    Frontend: React + TypeScript (Vite)

    Backend: Express.js + Sequelize ORM

    Base de Datos: MySQL 8.0

    Autenticación: Auth0 + JWT

    Orquestación: Docker Compose

Arquitectura del Sistema

Sistema organizado en tres capas con comunicación definida:

Client Tier (Frontend)
  │
  ▼ (HTTP API Calls + JWT)
Application Tier (Backend API)
  │
  ▼ (Sequelize ORM)
Data Tier (MySQL Database)

Componentes y Dependencias

graph TD
    A[Frontend React] -->|API Calls| B[Backend Express]
    B -->|ORM| C[MySQL Database]
    D[Auth0 Service] -->|JWT Validation| B
    E[Docker Compose] -->|Orchestrates| A
    E -->|Orchestrates| B
    E -->|Orchestrates| C


Puertos de servicio:

    Frontend: 5174

    Backend: 3000

    MySQL: 3306

Stack Tecnológico Completo
Capa	Tecnología	Propósito	Configuración
Frontend	React 18 + TypeScript	Interfaz de usuario	README Frontend
	Vite	Servidor desarrollo y build	
Backend	Node.js + Express	API REST	Servicio task-crud-insightt-backend
	Sequelize	ORM para MySQL	
Base de Datos	MySQL 8.0	Persistencia de datos	docker-compose.yml
Autenticación	Auth0 + JWT	Gestión de usuarios	Integrado en frontend y backend
Contenerización	Docker Compose	Entorno desarrollo unificado	docker-compose.yml


Variables de Entorno Clave
Servicio	Variable	Valor	Propósito
MySQL	MYSQL_DATABASE	insightt_db	Nombre base de datos
	MYSQL_USER	insightt_user	Usuario aplicación
	MYSQL_PASSWORD	insightt_pass	Contraseña aplicación
	MYSQL_ROOT_PASSWORD	root	Contraseña root
Backend	DB_HOST	mysql_db	Host base de datos
	DB_USER	insightt_user	Usuario DB
	DB_PASSWORD	insightt_pass	Contraseña DB
	DB_NAME	insightt_db	Nombre DB
Frontend	VITE_API_BASE_URL	http://localhost:3000	URL API backend
Flujo de Inicio y Dependencias

Secuencia de arranque controlada por Docker Compose:

    Inicio de MySQL:

        Monta volumen persistente db_data

        Ejecuta health check con mysqladmin ping

        Espera estado healthy

    Inicio de Backend:

        Depende de MySQL healthy

        Conecta a mysql_db:3306

        Inicia servidor Express en puerto 3000

    Inicio de Frontend:

        Depende de backend started

        Configura llamadas API a backend:3000

        Inicia servidor Vite en puerto 5174

Verificación de estado:

docker-compose ps

Características del Entorno de Desarrollo
🔄 Live Reloading

    Frontend: Volumen montado en ./task-crud-insightt:/app permite cambios en caliente

    Backend: Similar montaje para desarrollo en tiempo real

🌐 Acceso Directo

    Frontend: http://localhost:5174

    Backend: http://localhost:3000

    MySQL: localhost:3306 (usuario: root, contraseña: root)

🔍 Health Checks

Monitoreo de estado de servicios:

healthcheck:
  test: mysqladmin ping -h localhost -u root -proot
  interval: 5s
  timeout: 3s
  retries: 3

🔒 Aislamiento de Red

    Servicios comunicados mediante red bridge dedicada

    Seguridad por defecto sin exposición innecesaria

Estructura de Directorios

task-crud-insightt/          # Frontend
├── src/
│   ├── main.tsx
│   ├── App.tsx
│   ├── components/
│   └── ...

task-crud-insightt-backend/  # Backend
├── src/
│   ├── index.ts
│   ├── controllers/
│   ├── models/
│   └── ...

docker-compose.yml           # Configuración Docker

Workflow de Desarrollo

    Iniciar servicios:
    docker-compose up --build

Desarrollo frontend:

    Editar archivos en task-crud-insightt/

    Cambios reflejados automáticamente en http://localhost:5174

Desarrollo backend:

    Modificar código en task-crud-insightt-backend/

    Servidor se reinicia automáticamente

Acceso a base de datos:

docker-compose exec mysql_db mysql -u root -proot

Detener servicios:

docker-compose down