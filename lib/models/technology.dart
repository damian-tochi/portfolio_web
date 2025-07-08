import 'package:my_portfolio/core/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python =
      TechnologyModel("Python", AppConstants.pythonImage);
  static TechnologyModel kotlin = TechnologyModel("Kotlin", AppConstants.kotlinImage);
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage);
  static TechnologyModel flask =
      TechnologyModel("Flask", AppConstants.flaskImage);
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage);
  static TechnologyModel android =
      TechnologyModel("Android", AppConstants.androidImage);
  static TechnologyModel java =
      TechnologyModel("Java", AppConstants.javaImage);
  static TechnologyModel javascript =
      TechnologyModel("Javascript", AppConstants.javascriptImage);
  static TechnologyModel nestJs =
  TechnologyModel("Nest JS", AppConstants.nestJsImage);
  static TechnologyModel swift =
      TechnologyModel("Swift", AppConstants.swiftImage);
  static TechnologyModel sceneKit =
      TechnologyModel("SceneKit", AppConstants.sceneKitImage);
  static TechnologyModel typeScript =
      TechnologyModel("TypeScript", AppConstants.typeScriptImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    kotlin,
    swift,
    java,
    python,
    javascript,
    nestJs,
    typeScript
  ];
}
