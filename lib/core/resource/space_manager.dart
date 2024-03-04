import 'package:flutter/material.dart';

abstract class SpaceManager {
  static SizedBox sizedBox8h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.008,
      );
  static SizedBox sizedBox8w(context) => SizedBox(
        height: MediaQuery.sizeOf(context).width * 0.008,
      );
  static SizedBox sizedBox12h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.012,
      );
  static SizedBox sizedBox12w(context) => SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.012,
      );
  static SizedBox sizedBox14w(context) => SizedBox(
        width: MediaQuery.sizeOf(context).height * 0.014,
      );
  static SizedBox sizedBox16h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.016,
      );

  static SizedBox sizedBox24h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.024,
      );
  static SizedBox sizedBox32h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.032,
      );
  static SizedBox sizedBox40h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.04,
      );
  static SizedBox sizedBox50h(context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.05,
      );
  static SizedBox sizedBox39h(context) => SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.039,
  );

}
