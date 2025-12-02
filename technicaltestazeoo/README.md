# technicaltestazeoo

Bonjour Madame, Monsieur, pour information j'utilise l'IDE Visual Studio Code pour développer mon application Flutter et j'utilise l'émulateur Android Studio pour tester mon application.
Je tiens m'excuser si jamais, car je ne sais pas si l'application est compatible avec d'autres IDE, mais normalement je doute qu'il y ai un problème.

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

## Lancement de votre application

Pour finir ouvrir le terminal :
cd technicaltestazeoo
flutter devices (prendre en compte le nom de votre émulateur)
flutter run -d (nom et numéro de votre émulateur) (ex : flutter run -d emulator-5554)
