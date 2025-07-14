# Dicee App

---

This is a simple Flutter application that simulates the rolling of two dice with a fun animation and a sound effect. Perfect for a quick game or just to see some dice roll!

## Features

* **Interactive Dice:** Tap on either die to trigger a roll.
* **Rolling Animation:** Watch the dice rapidly cycle through numbers before settling on their final values.
* **Sound Effects:** A satisfying dice roll sound plays with each new roll.
* **Random Outcomes:** Each roll generates genuinely random numbers for both dice.

---

## Getting Started

These instructions will help you set up and run the Dicee app on your local machine.

### Prerequisites

Make sure you have the following installed:

* **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
* **A code editor**: Such as [VS Code](https://code.visualstudio.com/) with the Flutter plugin, or [Android Studio](https://developer.android.com/studio).

### Installation

1.  **Clone the repository** (if applicable, otherwise, download the project files):

    ```bash
    git clone https://github.com/wajidkorkani/Dice-App-in-Flutter.git
    cd dicee_app
    ```

2.  **Get dependencies**: Navigate to the project directory in your terminal and run:

    ```bash
    flutter pub get
    ```

3.  **Add Assets**:
    * Create an `Images` folder in the root of your project. Place your dice images (e.g., `dice1.png` through `dice6.png`) inside this folder.
    * Create a `Sounds` folder in the root of your project.

    Your `pubspec.yaml` file should then reference these assets like so:

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - Images/
        - Sounds/
    ```

---

## Running the App

After setting up, you can run the app on a connected device or emulator:

```bash
flutter run