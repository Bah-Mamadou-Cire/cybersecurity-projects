# Analyse des logs Cowrie

## Introduction
Ce document présente une analyse des logs générés par le honeypot Cowrie, déployé pour détecter et étudier les tentatives d'accès non autorisées via SSH.

## Emplacement et format des logs
Les logs sont disponibles au format JSON et texte dans le dossier de Cowrie (`/var/log/cowrie/`). Les événements principaux incluent les connexions, tentatives de login, et fermeture de session.

## Méthodologie d’analyse
L’analyse a été réalisée à partir d’extraits de logs JSON et texte. Les événements ont été triés par type pour identifier les comportements suspects et les statistiques principales.

## Statistiques principales

- **Nombre de connexions détectées** : 4 sessions SSH distinctes
- **Origine des connexions** : IP anonymisées, toutes sur le port 2222
- **Versions SSH utilisées** :  
  - SSH-2.0-OpenSSH_8.9p1 Ubuntu  
  - SSH-2.0-OpenSSH_10.0p2 Debian-5
- **Tentatives de login échouées** : 4 (utilisateur `user1`)
- **Durée moyenne des sessions** :  
  - 30.4s, 12.1s, 120.0s, 120.1s

## Exemples d’événements notables

```json
{
  "eventid": "cowrie.session.connect",
  "src_ip": "IP_REDACTED",
  "dst_port": 2222,
  "session": "SESSION_ID_1",
  "protocol": "ssh",
  "message": "New connection: IP_REDACTED:47894 (127.0.0.1:2222) [session: SESSION_ID_1]"
}
```

```json
{
  "eventid": "cowrie.login.failed",
  "username": "user1",
  "message": "login attempt [user1/***] failed",
  "timestamp": "2025-07-30T23:42:11.511428Z"
}
```

```text
2025-07-30T23:48:27.888279Z [HoneyPotSSHTransport,3,IP_REDACTED] login attempt [b'USERNAME_REDACTED'/b'***'] failed
2025-07-30T23:50:21.945343Z [HoneyPotSSHTransport,3,IP_REDACTED] Connection lost after 120.1 seconds
```

## Recommandations

- Surveiller les tentatives de connexion répétées sur le même utilisateur.
- Mettre à jour régulièrement la configuration du honeypot pour détecter de nouveaux vecteurs d’attaque.
- Automatiser l’analyse des logs pour générer des alertes en temps réel.

## Conclusion

Les logs montrent des tentatives d’accès SSH automatisées, principalement par brute-force sur l’utilisateur `user1`. Aucune connexion réussie n’a été observée. Le honeypot fonctionne correctement et permet de collecter des données utiles pour l’analyse des menaces.
