#!/bin/bash

echo "🔄 Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installation des paquets nécessaires..."
sudo apt install -y git python3-venv python3-pip libssl-dev libffi-dev build-essential

echo "📁 Clonage du dépôt Cowrie..."
git clone https://github.com/cowrie/cowrie.git
cd cowrie || exit

echo "📝 Copie du fichier de configuration..."
cp etc/cowrie.cfg.dist etc/cowrie.cfg

echo "🐍 Création de l'environnement virtuel..."
python3 -m venv cowrie-env

echo "✅ Activation de l'environnement virtuel..."
source cowrie-env/bin/activate

echo "📦 Installation des dépendances Python..."
pip install --upgrade pip
pip install -r requirements.txt

echo "🚀 Lancement de Cowrie..."
bin/cowrie start

echo "✅ Installation terminée ! Cowrie est en cours d'exécution."
