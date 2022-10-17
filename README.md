# flutter boilerplate repository
## _Code architecture followed by 55Tech developers._

[![N|Solid](https://www.fiftyfivetech.io/wp-content/uploads/2021/05/logo.png)](https://nodesource.com/products/nsolid)

 ✨ This repository showing that how we are using clean code architecture, folder structure, and component reusability.✨

## Features

- _**Functionality**_  : Work correctly, efficiently, and robustly.
- _**Readability**_    : The primary audience for our code is other developers.
-  _**Extensibility**_ : Well-designed code should be extensible as a building block for solving new problems.
- _**Scalability**_    : The code that can scale along with the need of your business.
- _**Testability**_    : Isolated and modularised code without dependencies, well testable at unit level.

## Tech

- [Flutter](https://flutter.dev/) - an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
- [Riverpod](https://riverpod.dev/) - a reactive caching and data binding framework.
- [Flutter Hooks](https://pub.dev/packages/flutter_hooks) - better lifecycle management and component (widget) reusability.


## Getting Started

This project is a starting point for a Flutter application.

*(explain about Combine Layered-Fearture Package architecture )


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Architecture and Project structure
This projects follows clean architecture, for the best result and following separation of concern we followed a combination of module and feature based layered architecture. The project is generally devided to different modules for each layer: Data module, Domain module, Presentation module, and also a core module for specific faetures like general error handling, themes and utilities, then for reusable features like social sign in it is managed as a separate module. The archirecture allows to define more plug & play modules whenever it is necessary without causing any side effects for future reusaibility and extensibility. 

# The project is structured in the following way:

~~~
├── .git
├── .gitignore
├── android
├── ios
├── core
├── data
├── domain
├── flutter_social_package
├── lib
|  ├── app
|  ├── formatter
|  ├── notification
|  |  └── notification_manager.dart
|  └─ main.dart   
| 
├── pubspec.yaml
├── pubspec.lock
└── README.md
~~~

## License

**55 Tech**

**We are relentlessly focusing on digital transformation. Dive deep into the customer cases to know more about the project which we delivered.**

