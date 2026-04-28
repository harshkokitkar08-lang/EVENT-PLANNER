#!/bin/sh
# EventMind start script

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "──────────────────────────────────────"
echo "  Starting EventMind AI Backend..."
echo "──────────────────────────────────────"

# Start backend in background
node backend/server.js &
BACKEND_PID=$!
echo "Backend started (PID $BACKEND_PID)"

# Start Vite frontend
node_modules/.bin/vite

# When vite exits, also kill backend
kill $BACKEND_PID 2>/dev/null
