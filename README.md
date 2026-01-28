# 🎬 CLI ANIME WINDOWS

[![Release](https://img.shields.io/github/v/release/MaloOllivier/CLI_ANIME_WINDOWS?color=CA9861&label=Version)](https://github.com/MaloOllivier/CLI_ANIME_WINDOWS/releases)
[![Discord](https://img.shields.io/badge/Discord-maloll-5865F2?logo=discord&logoColor=white)](https://discordapp.com/users/970348301448806430)

Installation et configuration automatique de **MPV**, **Syncplay** et **ani-cli** via Scoop pour un setup de streaming optimal.

---

## 📥 Téléchargement

[ ![Download](https://img.shields.io/badge/TÉLÉCHARGER-DERNIÈRE_RELEASE-CA9861?style=for-the-badge&logo=github) ](https://github.com/MaloOllivier/CLI_ANIME_WINDOWS/releases/latest)

> [!CAUTION]
> **IMPORTANT :** Une fois le fichier `.zip` téléchargé, tu **DOIS** l'extraire complètement avant de lancer l'installeur. Si tu lances le `.bat` directement depuis l'aperçu du ZIP, les fichiers de configuration ne seront pas trouvés.

---

## 🚀 Installation

1. Clique sur le bouton **TÉLÉCHARGER** ci-dessus.
2. Décompresse l'archive (Clic droit -> Extraire tout).
3. Double-clique sur `installer.bat`.
4. Patiente pendant que le script travaille. Un message s'affichera en <span style="color:#90EE90">**Vert Clair**</span> une fois terminé.

---

## 🖥️ Utilisation d'ani-cli

Pour regarder tes animes, utilise **Git Bash** (déjà inclus dans l'install) :

| Commande | Action |
| :--- | :--- |
| `ani-cli` | Menu interactif de recherche. |
| `ani-cli -s` | Pour regarder en simultané avec syncplay. |
| `ani-cli -u` | Met à jour l'outil vers la dernière version. |

---

## ⚙️ Configuration de Syncplay

Le script ne peut pas encore detecter automatiquement l'emplacement de MPV, au premier démarrage de syncplay :

1. Dans **"Chemin d'acces au lecteur multimédia:"**, colle ceci :
   `C:\Users\<TON_NOM>\scoop\apps\mpv\current\mpv.exe`  
   *(Remplace <TON_NOM> par ton utilisateur Windows)*

![Capture Syncplay](https://github.com/user-attachments/assets/daae165f-d27c-4bfd-aeb8-abf0fd64dda1)

---

## 🎨 Palette visuelle du script
* <span style="color:#CA9861">■</span> **Orange** : Informations et progression.
* <span style="color:#90EE90">■</span> **Vert Clair** : Succès de l'installation.
* <span style="color:#FF0000">■</span> **Rouge** : Erreur critique (vérifie le fichier `error.log`).

---
Fait par [MaloOllivier](https://github.com/MaloOllivier). ❤️