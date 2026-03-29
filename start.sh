#!/bin/bash
echo ""
echo "========================================"
echo "  TaskFlow — Starting Development Server"
echo "========================================"
echo ""

# Start backend
echo "[1/2] Starting backend server (port 3001)..."
cd "$(dirname "$0")/server" && npm run dev &
BACKEND_PID=$!

# Wait for backend
sleep 3

# Start frontend
echo "[2/2] Starting frontend (port 5173)..."
cd "$(dirname "$0")/client" && npm run dev &
FRONTEND_PID=$!

echo ""
echo "  App available at:  http://localhost:5173"
echo "  API running at:    http://localhost:3001"
echo ""
echo "  Press Ctrl+C to stop all servers"
echo ""

# Wait for both
wait $BACKEND_PID $FRONTEND_PID
