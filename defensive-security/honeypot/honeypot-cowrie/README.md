# 🐍 Honeypot Cowrie - Projet de Cybersécurité

Ce projet met en place un honeypot SSH/Telnet à l’aide de Cowrie afin d'attirer des attaquants, enregistrer leurs actions et analyser leurs techniques dans un environnement sécurisé.

## 🎯 Objectif

- Simuler un système vulnérable
- Capturer les actions des attaquants (commandes, téléchargements)
- Analyser les techniques d’intrusion
- Visualiser les logs

## ⚙️ Outils utilisés

- Cowrie
- Xubuntu 24.04 (VM VirtualBox)
- iptables
- Python3, venv
- (optionnel) ELK, tcpdump, Wireshark

## 📐 Architecture

_Schéma réseau_ (DMZ fictive, port forwarding, isolation réseau, etc.)

## 🛠️ Installation

Voir [`scripts/setup.sh`](scripts/setup.sh) ou [guide détaillé](cowrie-installation.md)

## �� Exemple de logs

Voir le dossier [`logs-samples/`](logs-samples/)

## 🔍 Analyse

Exemples d'attaques observées, mots de passe utilisés, commandes post-exploitation dans [`analysis/`](analysis/)

## 🛡️ Sécurité

- Isolation réseau (DMZ virtuelle)
- Aucune donnée sensible sur la VM
- Accès internet bloqué depuis Cowrie

## 📄 Licence

Projet open source, à but pédagogique uniquement.
