# flutter_adaptive_navbar_ui

A common design pattern on phones/tablets is to have bottom navigation, this type of navigation rarely translates well to web browsers. So how can we solve this problem? We can solve this by using 
```Dart
import 'package:flutter/foundation.dart' show kIsWeb;
  ```
to check whether or not our Flutter app has been compiled for the web. If it is running on the web we present the user with a more traditional navigationbar in the top and when the screen size gets to small we change it to a hamburger menu. All this while our users running our application as an app on their phone/tablet will have bottomnavigation. 

The online example includes the ability to change to "App mode" in order to see how the bottomnavigation looks like as well.

See an online example: <https://drysen1.github.io/flutter-web-examples/adaptive-navbar/#/>

Bottom navigation for users on phone/tablets.
![alt text](https://github.com/Drysen1/Flutter_Adaptive_Navbar_UI/blob/main/screenshots/floatingBottomBar.png)

Top navigation for users using web browsers.
![alt text](https://github.com/Drysen1/Flutter_Adaptive_Navbar_UI/blob/main/screenshots/adaptive_navbar_full.png)

Hamburger menu for users using web browsers on small screens.
![alt text](https://github.com/Drysen1/Flutter_Adaptive_Navbar_UI/blob/main/screenshots/adaptive_navbar_drawer.png)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
