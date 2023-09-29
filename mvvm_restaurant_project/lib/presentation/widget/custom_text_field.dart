import 'package:flutter/material.dart';

import '../resources/export_app_manager.dart';

class CustomTextFields {



  
  static Widget textFieldXL({
    required Stream<bool> stream,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String hintText,
    required String labelText,
    required String errorText,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
      child: StreamBuilder<bool>(
        stream: stream,
        builder: (context, snapshot) {
          return TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              errorText: (snapshot.data ?? true) ? null : errorText,
            ),
          );
        },
      ),
    );
  }

  // More TextField widgets...
}
