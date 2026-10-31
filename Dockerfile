FROM barichello/godot-ci:4.3-server

# Copy your exported Godot server build or project files
COPY . /app
WORKDIR /app

# Run the Godot dedicated server in headless mode
# Ensure your script or command uses the $PORT env if applicable, or a default port
CMD ["godot", "--headless", "--main-pack", "game.pck"]