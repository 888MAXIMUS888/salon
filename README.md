# salon

A new Flutter project.

## Getting Started

Follow the official documentation for installation information [here](https://flutter.dev/docs/get-started/install)

BLoC Architecture documentation can be found [here](https://bloclibrary.dev/#/)

## Peculiarities

* Null-safety support
* Used Clean Architecture approach and BLoC pattern
* Used Flutter Intl for localization. Also used plugins([Android Studio](https://plugins.jetbrains.com/plugin/13666-flutter-intl) / [VS Code](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)) for autogenerate code.
* Used DI by [GetIt](https://pub.dev/packages/get_it)
* ...

## Peculiarities for API

Used [retrofit](https://pub.dev/packages/retrofit) for API calls. After clone application OR after change app_api_service.dart Need to call

`flutter pub run build_runner build`

for generate app_api_service.g.dart.
