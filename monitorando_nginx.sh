#!/bin/bash

# Nome do serviço
SERVICE="nginx"

# Local do diretório usado para salvar os log's
OUTPUT_DIR="/var/www/html/servidor_script_nginx/OUTPUT_DIR"

# Cria o diretório de saída (caso ele não tenha sido criado ainda)
sudo mkdir -p "$OUTPUT_DIR"

# Data e hora atual
TEMPO_ATUAL=$(date "+%Y-%m-%d %H:%M:%S")

# Monitora o status do nginx
if systemctl is-active --quiet $SERVICE; then
	# Mensagem de status online
	STATUS="ONLINE"
	MESSAGE="O servidor está online"
	# Log do servidor online
	echo "$TEMPO_ATUAL - $SERVICE - Status: $STATUS - $MESSAGE" >> "$OUTPUT_DIR/nginx_online.log"
else
	# Mensagem de status offline
	STATUS="OFFLINE"
	MESSAGE="O servidor está offline"
	# Log do servidor offline
	echo "$TEMPO_ATUAL - $SERVICE - Status: $STATUS - $MESSAGE" >> "$OUTPUT_DIR/nginx_offline.log"
fi
