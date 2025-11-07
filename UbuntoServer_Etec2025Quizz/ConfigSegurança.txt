#!/bin/bash

echo "Iniciando configuração de segurança..."

# Atualiza pacotes
sudo apt update && sudo apt upgrade -y

# Ativa AppArmor
echo " Ativando AppArmor..."
sudo systemctl enable apparmor
sudo systemctl start apparmor

# Ativa auditd
echo "Ativando auditd..."
sudo systemctl enable auditd
sudo systemctl start auditd

# Ativa Fail2Ban
echo "Ativando Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Configura iptables com portas bloqueadas
echo " Configurando firewall com iptables..."
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# Permitir conexões estabelecidas
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Bloquear portas SSH, HTTP e HTTPS explicitamente
sudo iptables -A INPUT -p tcp --dport 22 -j DROP    # SSH
sudo iptables -A INPUT -p tcp --dport 80 -j DROP    # HTTP
sudo iptables -A INPUT -p tcp --dport 443 -j DROP   # HTTPS

# Salvar regras
sudo netfilter-persistent save

# Atualiza e inicia ClamAV

sudo freshclam
sudo systemctl enable clamav-freshclam
sudo systemctl start clamav-freshclam
sudo systemctl enable clamav-daemon
sudo systemctl start clamav-daemon

# Rodando auditoria com Lynis
echo "Rodando auditoria com Lynis..."
sudo lynis audit system

echo " Segurança configurada com sucesso!"
