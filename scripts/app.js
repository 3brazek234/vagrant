cat << 'EOF' > app.js
const http = require('http');

const server = http.createServer((req, res) => {
    res.end("Hello from Vagrant! Version 1"); 
});

server.listen(3000, () => {
    console.log("Server is running on port 3000...");
});
EOF