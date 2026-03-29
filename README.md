# TaskFlow — Command Center

A full-stack task management application with a real-time Kanban board, built with React + Node.js + SQLite.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React 18, Vite, Tailwind CSS, React Router |
| Backend | Node.js, Express.js |
| Database | SQLite via Prisma ORM |
| Auth | JWT + bcryptjs |
| Real-time | Socket.io |
| Icons | Lucide React |

---

## ⚡ Quick Start

### Prerequisites
- Node.js 18+ installed
- npm 9+ installed

---

### Step 1 — Set up the Backend

```bash
cd server
npm install
npx prisma generate
npx prisma db push
npm run dev
```

The server starts at **http://localhost:3001**

---

### Step 2 — Set up the Frontend (new terminal)

```bash
cd client
npm install
npm run dev
```

The app opens at **http://localhost:5173**

---

## Project Structure

```
task-manager/
├── server/
│   ├── prisma/
│   │   └── schema.prisma       # Database schema (User + Task)
│   ├── src/
│   │   ├── controllers/
│   │   │   ├── authController.js   # Register, Login, Me
│   │   │   └── taskController.js   # CRUD operations
│   │   ├── middleware/
│   │   │   └── authMiddleware.js   # JWT verification
│   │   ├── routes/
│   │   │   ├── authRoutes.js
│   │   │   └── taskRoutes.js
│   │   ├── sockets/
│   │   │   └── taskSocket.js       # Socket.io events
│   │   └── index.js                # Express entry point
│   ├── .env                        # Environment variables
│   └── package.json
│
└── client/
    ├── src/
    │   ├── components/
    │   │   ├── Board.jsx       # Kanban board container
    │   │   ├── Column.jsx      # Drop target column
    │   │   ├── Header.jsx      # Search + New Task button
    │   │   ├── Sidebar.jsx     # Nav + user info
    │   │   ├── TaskCard.jsx    # Draggable task card
    │   │   └── TaskModal.jsx   # Create/Edit modal
    │   ├── context/
    │   │   ├── AuthContext.jsx
    │   │   ├── SocketContext.jsx
    │   │   └── TaskContext.jsx
    │   ├── pages/
    │   │   ├── Dashboard.jsx
    │   │   ├── Login.jsx
    │   │   └── Register.jsx
    │   └── services/
    │       └── api.js          # Axios instance with JWT interceptor
    ├── index.html
    ├── tailwind.config.js
    └── vite.config.js
```

---

## Features

- **Authentication** — Register / Login with JWT, auto-redirect on session expiry
- **Kanban Board** — Three columns: To Do · In Progress · Done
- **Drag & Drop** — Drag cards between columns to update status instantly
- **Task CRUD** — Create, edit, delete tasks with priority, due date, description
- **Filters** — Sidebar filters: All / To Do / In Progress / Done / High Priority
- **Search** — Real-time search across task titles and descriptions
- **Real-time sync** — Socket.io broadcasts changes to all open sessions
- **Responsive** — Mobile-first with collapsible sidebar
- **Overdue dates** — Due dates turn red when past due

---

## API Endpoints

### Auth
| Method | Path | Description |
|---|---|---|
| POST | /api/auth/register | Create account |
| POST | /api/auth/login | Sign in |
| GET | /api/auth/me | Get current user |

### Tasks (all require `Authorization: Bearer <token>`)
| Method | Path | Description |
|---|---|---|
| GET | /api/tasks | Get all tasks for user |
| POST | /api/tasks | Create task |
| PUT | /api/tasks/:id | Update task |
| DELETE | /api/tasks/:id | Delete task |

---

## Environment Variables

### Server (`server/.env`)
```
PORT=3001
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production-min-32-chars
DATABASE_URL="file:./dev.db"
CLIENT_URL=http://localhost:5173
```

---

## Troubleshooting

**"Cannot find module @prisma/client"**
```bash
cd server && npx prisma generate
```

**Database not found**
```bash
cd server && npx prisma db push
```

**Port already in use**
- Change `PORT` in `server/.env`
- Change port in `vite.config.js` for client

**CORS errors**
- Ensure `CLIENT_URL` in `server/.env` matches the Vite dev server URL exactly
