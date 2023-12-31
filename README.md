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
- [Freezed](https://pub.dev/packages/freezed) -  code generator for data-classes/unions/pattern-matching/cloning.
- [Flutter Lints](https://pub.dev/packages/flutter_lints) -  recommended set of lints for Flutter apps, packages, and plugins to encourage good coding practices.

# Getting Started

This project is a starting point for a Flutter application.

## Architecture and Project structure
This projects follows clean architecture, we adopted layered architecture, to obtain clear separation of concerns between different part of the systems.  The architecture is based on the combined layer first and feature first architecture approach. Following the layered first principles the project is generally devided to different modules: Data module, Domain module, Presentation module, and following feature first appraoch more modules can be added as plug & play whenever it is necessary. The project now also have a Core module for specific faetures like general error handling, themes and utilities, and a social sign in module. This archirecture design give freedom to define more modules without causing any side effects for future reusaibility and extensibility. 

### Data Layer
This layer contains all the repositories to communnicate with local db or REST API's according to the interest of communication. The networks calls are handled here and converted to models. Data layer is responsible for data caching if needed.

### Domain Layer
Domain layer is present to abstract the complex business logics such as combination of various repository calls as well as different usecases that may be reused from various UI's. The services and usecases are defined in the domain layer.

### Presentation Layer
Presentation layer contains the UI's and it's states. Providers are defined in the presentation layer and it is separated from the UI managing the states. This is how the UI is separated free from the business implementation as well as stae management. 

### Adding/developing a new Feature to the boilerplate
All the UI Widgets, Controller should be added to the presentation layer, that lies inside the lib folder under the main project structure. Business logic is handled in the domain layer, and all the data communication happens in the data layer.

To add any new feature, start from defining a model in  domain layer under 'model' folder and create its reposiorty class containing the abstract methods in 'repository' folder in domain layer. Implement this repository in the data layer under 'repository' folder and call the currespoding services for data handling. All the business logic is handled in the domain layer under 'usecase' folder which binds the data layer and presentation layer. create a 'viewmodel' which contains the state of the UI. viewmodels uses providers and state notifiers to achive the result, accessing the business logic from usecases.  UI screen in Presentation is created under 'pages' folder reusuing the 'widgets' may be, all the actions and triggers are called from viewmodel from the UI.

Each layer are independent module with clear separations, we used providers extensively to apply the dependency injection, to achieve the inversion of control priciples. 

## The project is structured in the following way:

~~~
├── .git
├── .gitignore
├── android
├── ios
├── core
├── data
|  ├── lib
|  |  ├── repository
|  |  | ├── network
|  |  | └─ local db 
|  |  └─ firebase   
|
|
├── domain
|   ├── lib
|   |  ├── model
|   |  └─ repository   
|   |  └─ usecases   
|
|
|
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

*/lib* - contains the presentation layer, the UI widgets, state management with riverpod and its provider files.

*/lib/pages* - Here we add the highlevel widgets that contains the entire page design with multiple reused widgets.

*/lib/widgets* - This folder contains the micro level base widgets that can be tested independently and reused across the application. If more then two pages need to use the any widget, then it should be moved to the widget folder.

*/assets* - Saving images, files etc in src directory is a good solution and it is oftentimes encouraged to use instead of the static file serving. You need to store images in /assets folder.


## License

**55 Tech**

**We are relentlessly focusing on digital transformation. Dive deep into the customer cases to know more about the project which we delivered.**

