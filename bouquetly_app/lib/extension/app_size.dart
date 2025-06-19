import 'package:flutter/material.dart';

extension AppSize on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  getHight() {
    return MediaQuery.of(this).size.height;
  }
}
