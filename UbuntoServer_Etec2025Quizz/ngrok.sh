
##  1. Instalar PHP (se ainda não tiver)

```bash
sudo apt update
sudo apt install php php-cli php-mbstring unzip curl
```

---

##  2. Instalar MySQL (se precisar banco de dados)

```bash
sudo apt install mysql-server
sudo service mysql start
```

---

##  3. Instalar o Ngrok

Baixe e instale o Ngrok:

```bash
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null

echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
sudo tee /etc/apt/sources.list.d/ngrok.list

sudo apt update
sudo apt install ngrok
```

---

##  4. Configurar Authtoken

Pegue seu token no [Dashboard do Ngrok](https://dashboard.ngrok.com/get-started/setup) e rode:

```bash
ngrok config add-authtoken SEU_TOKEN_AQUI
```

---

##  5. Rodar o servidor PHP

Na pasta do seu projeto:

```bash
php -S localhost:3000
```

Isso vai servir seu site em `http://localhost:3000`.

---

##  6. Expor com Ngrok

Em outro terminal:

```bash
ngrok http 3000
```

O Ngrok vai gerar um link público, algo como:

```
Forwarding  https://gabriel.ngrok-free.app -> http://localhost:3000
```

---
## 7. qrcode
qrencode -t ansiutf8 "https://lifxspsr5l.sharedwithexpose.com"
