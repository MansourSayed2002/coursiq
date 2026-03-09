import 'package:coursiq/core/enum/field_type.dart';
import 'package:flutter/material.dart';

String? validationField(
  BuildContext context,
  FieldType type,
  int min,
  int max,
  String? value,
) {
  if (type == FieldType.text) {
    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value ?? "")) {
      return "Please enter the correct name.";
    }
  }
  if (type == FieldType.email) {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value ?? "")) {
      return "Please enter the correct email";
    }
  }
  if (type == FieldType.number) {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value ?? "")) {
      return "Please enter the correct numbers.";
    }
  }
  if (type == FieldType.password) {
    if (!RegExp(r'^[A-Za-z0-9]+$').hasMatch(value ?? "")) {
      return "برجاء ادخال القيمه المطلوبه";
    }
  }
  if (value!.isEmpty) {
    return "The field cannot be left blank.";
  } else if (value.length > max) {
    return "Cannot contain more than one field $max";
  } else if (value.length < min) {
    return "The field content cannot be smaller than $min";
  }
  return null;
  // return "Please enter the correct value";
}
