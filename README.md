# Flutter Web Experiment

*WORK IN PROGRESS*

With this project I will attempt to build a web page/app without any html, css or JS. Instead I will build it with Google's Flutter framework and the Dart programming language.

The source code is in the /lib folder

Make sure to install dependencies in pubspec.yaml file if cloning.


## These are the steps I took to install Flutter and set it up on a Windows machine.

1. Make sure you have git and powershell installed.
2. In powershell create a `C:\src\` folder and navigate to it and paste 
`git clone https://github.com/flutter/flutter.git -b stable`
3. Add `c:\src\flutter\bin` to environment variables PATH
4. in powershell run `C:\src\flutter>flutter doctor`
5. in VS Code add flutter extension
6. in VS Code add Material theme
7. in the terminal in VS Code run:
```
    flutter channel beta
    flutter upgrade
    flutter config --enable-web
```

Things might change so check Flutter's documentation: 

https://flutter.dev/docs/get-started/install/windows

https://flutter.dev/docs/get-started/web


## To start a new Flutter project in VS Code

1. Go to View -> Command Pallette OR Ctrl+Shift+P
2. Type `Flutter: New Project`
3. Enter Project name and it will prompt you to save it somewhere
4. Flutter web app will be built. 
5. flutter run -d chrome to run in browser
6. every time you make a change you can simply type "r" in the terminal and it will update the changes in chrome.


https://flutter.dev/docs/get-started/web