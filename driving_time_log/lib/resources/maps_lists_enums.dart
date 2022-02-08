import 'package:flutter/material.dart';

import 'colors.dart';

//maps
Map<String, Color> iconColors = {
  'driving': green,
  'otherWork': blue,
  'service': red,
  'out': cyan,
  'sleepAndBreak': orange,
};

Map<String, String> iconPaths = {
  'driving': 'assets/driving.svg',
  'otherWork': 'assets/otherWork.svg',
  'service': 'assets/service.svg',
  'out': 'assets/out.svg',
  'sleepAndBreak': 'assets/sleepAndBreak.svg',
};

Map<String, IconsAndNames> iconEnum = {
  'driving': IconsAndNames.driving,
  'otherWork': IconsAndNames.otherWork,
  'service': IconsAndNames.service,
  'out': IconsAndNames.out,
  'sleepAndBreak': IconsAndNames.sleepAndBreak,
};

//lists
List<String> iconNames = [
  'driving',
  'otherWork',
  'service',
  'out',
  'sleepAndBreak',
];

//enums
enum IconsAndNames {
  driving,
  otherWork,
  service,
  out,
  sleepAndBreak,
}
