const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 10000;

// Essential headers for Godot 4 WebAssembly / SharedArrayBuffer
app.use((req, res, next) => {
    res.setHeader("Cross-Origin-Opener-Policy", "same-origin");
    res.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
    next();
});

// Serve static files from your Godot export directory
app.use(express.static(path.join(__dirname, 'public')));

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Game running on port ${PORT}`);
});