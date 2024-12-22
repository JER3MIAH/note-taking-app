const String baseSvgPath = 'assets/svgs/';
const String basePngPath = 'assets/pngs/';
const String baseJsonPath = 'assets/json/';

extension ImageExtension on String {
  // png paths
  String get png => '$basePngPath$this.png';
  // svgs path
  String get svg => '$baseSvgPath$this.svg';
  // jsons path
  String get json => '$baseJsonPath$this.json';
}

//* pngs

//* svgs
//? Bottom nav bar icons
final String homeOutlined = 'homeOutlined'.svg;
final String homeFilled = 'homeFilled'.svg;
final String presetsOutlined = 'presetsOutlined'.svg;
final String presetsFilled = 'presetsFilled'.svg;
final String customOutlined = 'customOutlined'.svg;
final String customFilled = 'customFilled'.svg;
final String savedOutlined = 'savedOutlined'.svg;
final String savedFilled = 'savedFilled'.svg;
final String profileOutlined = 'profileOutlined'.svg;
final String profileFilled = 'profileFilled'.svg;

//* Home icons
final String yellowClock = 'yellowClock'.svg;
final String lines = 'lines'.svg;
final String splashImg = 'splash-img'.png;

//*
final String layersIcon = 'layersIcon'.svg;
final String skipIcon = 'skipIcon'.svg;
final String arrowBackIcon = 'arrowBackIcon'.svg;
final String checkIcon = 'checkIcon'.svg;
final String playIcon = 'playIcon'.svg;
final String cancelcon = 'cancelcon'.svg;
final String shockedEmoji = 'shockedEmoji'.svg;
final String checkWrapper = 'checkWrapper'.svg;

//* Profile icons
final String bellIcon = 'bellIcon'.svg;
final String statsIcon = 'statsIcon'.svg;
final String soundIcon = 'soundIcon'.svg;
final String starIcon = 'starIcon'.svg;
final String logoutIcon = 'logoutIcon'.svg;
final String editIcon = 'editIcon'.svg;

//* Preset details
final String restTimeIcon = 'restTimeIcon'.svg;
final String workTimeIcon = 'workTimeIcon'.svg;

//* json
final String celebration = 'celebration'.json;
final String checkAnimation = 'checkAnimation'.json;
