# Interview Q&A Application - Docker Setup

## Project Structure
```
interview_project/
├── index.html           # Frontend
├── server.js            # Node.js backend
├── package.json         # Node dependencies
├── Dockerfile           # App container
├── docker-compose.yml   # Container orchestration
└── .gitignore          # Git ignore
```

## Setup Instructions

### Prerequisites
- Docker installed
- Docker Compose installed

### Quick Start

1. **Build and Start Containers:**
   ```bash
   docker-compose up -d
   ```

2. **Check Container Status:**
   ```bash
   docker-compose ps
   ```

3. **View Application:**
   - Open browser: `http://localhost:3000`

### Available Endpoints

- **Health Check:** `GET http://localhost:3000/api/health`
- **Get Questions:** `GET http://localhost:3000/api/questions`
- **Add Question:** `POST http://localhost:3000/api/questions`

### Database Access

```bash
# Access MySQL container
docker exec -it interview_mysql mysql -u root -p
# Password: password

# Select database
USE interview_db;

# View questions table
SELECT * FROM questions;
```

### Useful Commands

```bash
# View container logs
docker-compose logs -f app
docker-compose logs -f mysql

# Stop containers
docker-compose down

# Remove volumes (delete data)
docker-compose down -v

# Rebuild containers
docker-compose up -d --build

# Connect to app container
docker exec -it interview_app sh
```

## Architecture

```
┌─────────────────┐
│   Browser       │
│  Port: 3000     │
└────────┬────────┘
         │
┌────────▼──────────────┐
│   Node.js App         │
│   Container           │
│  ├─ server.js         │
│  ├─ index.html        │
│  └─ Port: 3000        │
└────────┬──────────────┘
         │
    (Network: interview_network)
         │
┌────────▼──────────────┐
│   MySQL Database      │
│   Container           │
│  ├─ interview_db      │
│  └─ Port: 3306        │
└───────────────────────┘
```

## Environment Variables

### MySQL Container
- `MYSQL_ROOT_PASSWORD`: password
- `MYSQL_DATABASE`: interview_db
- `MYSQL_USER`: interview_user
- `MYSQL_PASSWORD`: interview_password

### App Container
- `DB_HOST`: mysql (service name)
- `DB_USER`: root
- `DB_PASSWORD`: password
- `DB_NAME`: interview_db
- `NODE_ENV`: production

## Features

✅ Node.js Express backend with MySQL integration
✅ Docker containerization
✅ Docker Compose for multi-container orchestration
✅ Health checks for reliability
✅ Network isolation with custom bridge network
✅ Persistent MySQL data with volumes
✅ Static frontend serving
✅ CORS enabled for API access
