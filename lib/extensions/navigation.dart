import 'package:flutter/material.dart';

extension Nav on Widget {
  push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
      ),
    );
  }
}

extension Pop on BuildContext {
  get pop => Navigator.pop(this);
}
