## Getting Started

A flutter basede UI mobile coffee shop application developed with basic stripe payment integration for mobile development practices.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/mayank1211/flutter-coffee-shop.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3 (Optional - Additional setup is required):**

Open Andriod Simulator:

```
emulator -avd name-of-your-emulator
```

Open IOS Simulator - (Only works with Macbook):

```
open -a simulator
```

**Step 4:**

Start the projecet by running:

```
flutter run
```

## Boilerplate Features:

* Home
* Theme
* Provider (State Management)
* Code Generation

### Up-Coming Features:

* User / Email Notifications
* Dark Theme Support
* Multilingual Support
* Connectivity Support
* Background Fetch Support
* OS Supported Payment Integration
* Local / Firebase Storage Support
* Better Theme UI
* Routing
* API Based Data

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Database](https://github.com/tekartik/sembast.dart)
* [MobX](https://github.com/mobxjs/mobx.dart) (to connect the reactive data of your application with the UI)
* [Provider](https://github.com/rrousselGit/provider) (State Management)
* [Encryption](https://github.com/xxtea/xxtea-dart)
* [Validation](https://github.com/dart-league/validators)
* [Logging](https://github.com/zubairehman/Flogs)
* [Notifications](https://github.com/AndreHaueisen/flushbar)
* [Json Serialization](https://github.com/dart-lang/json_serializable)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- components/
|- constants/
|- models/
|- pages/
|- main.dart
```

<!-- Now, lets dive into the lib folder which has the main code for the application.

```
1- components - Contains the UI design and stripe payment of your project, includes directories for local, network and shared pref/cache.
2- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.

3- stores - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI. 
4- ui — Contains all the ui of your project, contains sub directory for each screen.
5- util — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
7- routes.dart — This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
``` -->

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_theme.dart
```
<!-- |- dimens.dart
|- endpoints.dart
|- preferences.dart
|- strings.dart -->

<!-- ### Data

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories `local`, `network` and `sharedperf`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

```
data/
|- local/
    |- constants/
    |- datasources/
    |- app_database.dart
   
|- network/
    |- constants/
    |- exceptions/
    |- rest_client.dart
    
|- sharedpref
    |- constants/
    |- shared_preference_helper.dart
    
|- repository.dart

``` -->

<!-- ### Stores

The store is where all your application state lives in flutter. The Store is basically a widget that stands at the top of the widget tree and passes it's data down using special methods. In-case of multiple stores, a separate folder for each store is created as shown in the example below:

```
stores/
|- login/
    |- login_store.dart
    |- form_validator.dart
``` -->

<!-- ### UI

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
ui/
|- login
   |- login_screen.dart
   |- widgets
      |- login_form.dart
      |- login_button.dart
``` -->
<!-- 
### Utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows: 

```
utils/
|- encryption
   |- xxtea.dart
|- date
  |- date_time.dart
```

### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- app_icon_widget.dart
|- empty_app_bar.dart
|- progress_indicator.dart
``` -->

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:coffe_shop/pages/Home_Page.dart';
import 'package:coffe_shop/pages/start_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'models/coffee_shop.dart';

void main() async {
  //Initialize Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  //Assign publishable key to flutter_stripe
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51KtCCyCmrbEExMw59tpI3UJT5HrMT68I54M91td97nsKKuho5tIA2Ltor1cbmB8sicwfHwQ6w2xXtms1R05N0Is500KsC4QNKb";
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    );
  }
}

```