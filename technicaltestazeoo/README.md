# technicaltestazeoo

Bonjour Madame/Monsieur,
pour information j'utilise l'IDE Visual Studio Code pour développer cette application Flutter et j'utilise Android Studio pour mon émulateur Android.
Je tiens m'excuser si jamais cette application ne fonctionne pas sur un autre IDE, mais normalement je doute qu'il y ai un quelconque problème.

## Prérequis

Tout d'abord, s'assurer que Flutter et votre environnement est bien configuré correctement (Flutter, SDK, émulateur, Android Studio, Visual Studio Code, etc.)

Pour vérifier cela : Ouvrir le Terminal et taper "flutter doctor".

Si tout est bien configuré, vous devriez avoir ceci (Visual Studio est facultatif j'utilise VSCode personnellement) :

Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 3.38.3, on Microsoft Windows [version 10.0.26100.7171], locale fr-FR)
[√] Windows Version (11 Professionnel 64-bit, 24H2, 2009)
[√] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
[√] Chrome - develop for the web
[X] Visual Studio - develop Windows apps
X Visual Studio not installed; this is necessary to develop Windows apps.
Download at https://visualstudio.microsoft.com/downloads/.
Please install the "Desktop development with C++" workload, including all of its default components
[√] Connected device (4 available)
[√] Network resources

## Configuration de votre émulateur

Également, s'assurer que votre émulateur est configuré correctement et que vos images sont installées sur Android Studio.
Si ce n'est pas le cas :
Aller dans Android Studio -> More Actions -> SDK Manager -> SDK Tools :
-Vérifier dans SDK Platforms que vous avez bien installé un Android au préalable (son SDK et sa source), vérifier que les images sont installées en cochant "Show Packages Details" (Exemple : Google APIs Intel x86_64 Atom System Image ou autres...)
-Dans votre SDK Tools veillez à ce que vous ayez bien installé les packages par défaut et "Android SDK Command-line Tools"

## Extension appréciée

-Avoir installé l'extension Flutter (Flutter Tools) pour Visual Studio Code
-Avoir installé l'extension Android iOS Emulator pour Visual Studio Code

## Configuration de l'appel API

-Installer le package http -> ouvrir le terminal et taper "flutter pub add http"

## Lancement de votre application

Pour finir ouvrir le terminal :
cd technicaltestazeoo
flutter devices (prendre en compte le nom de votre émulateur)
flutter run -d (nom et numéro de votre émulateur) (ex : flutter run -d emulator-5554)

ou (si l'émulateur n'est pas activé)

-utiliser l'extension Android iOS Emulator, en cliquand en bas à droite sur "windows" ou "No device" et en choississant l'émulateur mobile voulu et ensuite runner votre application.
