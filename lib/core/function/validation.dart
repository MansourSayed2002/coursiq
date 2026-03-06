import 'package:flutter/material.dart';

String validationField(
  BuildContext context,
  String type,
  int min,
  int max,
  value,
) {
  if (type == "text") {
    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value)) {
      return "Please enter the correct name.";
    }
  }
  if (type == "email") {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return "Please enter the correct email";
    }
  }
  if (type == "number") {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Please enter the correct numbers.";
    }
  }
  if (value.isEmpty) {
    return "The field cannot be left blank.";
  } else if (value.length > max) {
    return "Cannot contain more than one field $max";
  } else if (value.length < min) {
    return "The field content cannot be smaller than $min";
  }
  return "Please enter the correct value";
}
