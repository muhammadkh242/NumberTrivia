import 'package:flutter/material.dart';
import 'package:nums/common/constants.dart';

mixin BaseViewMModel {
  showSnackBar(String message) {
    final context = Constants.navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
