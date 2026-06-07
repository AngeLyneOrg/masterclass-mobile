# 📱 MasterClass - Mobile Client

## 📝 Présentation du Projet
Ce dépôt contient le code source de l'application mobile de la plateforme **MasterClass**, un écosystème d'apprentissage du développement logiciel. L'application est conçue pour offrir une expérience utilisateur fluide, interactive et accessible même dans des conditions réseau instables.

### 🌟 Fonctionnalités Clés
- **Classroom & Offline Mode :** Consultation du catalogue de cours et lecture vidéo avec mise en cache locale automatique pour l'accès hors-ligne.
- **Interactive Assessments :** Moteur de quiz et playground d'écriture de code avec coloration syntaxique intégrée.
- **AI Tutor Chat :** Canal de communication temps réel (WebSockets) avec un tuteur virtuel intelligent pour la remédiation des lacunes.
- **Gamification & Affiliation :** Système de badges de compétences et gestion d'un portefeuille virtuel de parrainage.

---

## 🛠️ Stack Technique & Outils
- **Framework Principal :** Flutter 3.x & Dart
- **Gestion d'État (State Management) :** Bloc / Riverpod (Architecture découplée)
- **Navigation :** GoRouter
- **Persistance Locale (Offline Cache) :** Hive / Isar Database
- **Sécurité :** Flutter Secure Storage (Stockage chiffré des tokens JWT)

---

## 📂 Architecture des Dossiers
Le projet adopte une approche **Feature-First** combinée aux principes de la *Clean Architecture* :

```text
lib/
├── core/                         # Composants globaux et partagés
│   ├── constants/                # Thèmes, couleurs (AppColors), dimensions
│   ├── error/                    # Gestion centralisée des exceptions
│   ├── routes/                   # Configuration des routes de navigation
│   └── services/                 # Services partagés (WebSocket, NetworkInfo)
└── features/                     # Modules métiers isolés
    ├── auth/                     # Authentification & Session (JWT)
    ├── classroom/                # Gestion des cours & visionnage
    ├── assessment/               # Quiz et défis de code
    └── ai_tutor/                 # Interface du Chatbot IA
