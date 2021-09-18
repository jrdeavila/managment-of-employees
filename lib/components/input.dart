import "package:flutter/material.dart";

// ignore: must_be_immutable
class InputText extends TextField {
  String placeholder;
  bool secret;
  TextEditingController? controller;
  TextInputType textInputType;
  InputText(
      {this.placeholder = "",
      this.secret = false,
      this.textInputType = TextInputType.text,
      this.controller})
      : super(
            keyboardType: textInputType,
            obscureText: secret,
            decoration: InputDecoration(
              labelText: placeholder,
              border: const OutlineInputBorder(),
            ),
            controller: controller);
}
