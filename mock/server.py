import http.server
import socketserver
import os

PORT = 8000

# Obtém o caminho da pasta "mock"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Arquivo HTML que será retornado sempre
HTML_FILE = os.path.join(BASE_DIR, "indisponivel.html")

class MockHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        """Responde sempre com indisponivel.html"""
        try:
            with open(HTML_FILE, "rb") as f:
                content = f.read()

            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(content)))
            self.end_headers()
            self.wfile.write(content)

        except Exception as e:
            self.send_error(500, f"Erro no mock: {e}")

print(f"Mock rodando em http://localhost:{PORT}")
with socketserver.TCPServer(("", PORT), MockHandler) as httpd:
    httpd.serve_forever()
