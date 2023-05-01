import 'package:flutter/material.dart';
import 'package:myflutterprofile/resources/constants/colors.dart';

Color _getTextColor(MyButtonType type) {
  switch (type) {
    case MyButtonType.blue:
      return Colors.white;
    case MyButtonType.outlinedBlue:
      return GlobalColors.textButtonBlack;
    case MyButtonType.gray:
      return GlobalColors.textButtonBlack;
    case MyButtonType.outlinedGray:
      return GlobalColors.gray;
  }
}

Color _getBackgroundColor(MyButtonType type) {
  switch (type) {
    case MyButtonType.blue:
      return GlobalColors.primaryColor;
    case MyButtonType.outlinedBlue:
      return GlobalColors.textButtonBackgroundWhite;
    case MyButtonType.gray:
      return GlobalColors.textButtonGray;
    case MyButtonType.outlinedGray:
      return GlobalColors.textButtonGray;
  }
}

Color _getBorderColor(MyButtonType type) {
  switch (type) {
    case MyButtonType.blue:
      return GlobalColors.primaryColor;
    case MyButtonType.outlinedBlue:
      return GlobalColors.primaryColor;
    case MyButtonType.gray:
      return GlobalColors.primaryColor;
    case MyButtonType.outlinedGray:
      return GlobalColors.gray;
  }
}

class MyRawButton extends StatelessWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  final double height;
  final double cornerRadius;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback? onPressed;

  const MyRawButton(
      {Key? key,
      this.onPressed,
      required this.name,
      required this.textColor,
      required this.backgroundColor,
      required this.height,
      required this.cornerRadius,
      required this.borderColor,
      required this.borderWidth,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: textColor, backgroundColor: backgroundColor,
        // minimumSize: const Size(20, 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
            side: BorderSide(color: borderColor, width: borderWidth)),
      ),
      onPressed: onPressed,
      child: Container(
        height: height,
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: textColor,
            fontFamily: 'Poppins'
          )
        ),
      ),
    );
  }
}

enum MyButtonType { blue, outlinedBlue, gray, outlinedGray }

class MyButton extends StatelessWidget {
  final String name;
  final MyButtonType type;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  const MyButton(
      {Key? key,
      this.height = 55,
      this.width = 20,
      required this.name,
      required this.type,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRawButton(
      name: name,
      textColor: _getTextColor(type),
      backgroundColor: _getBackgroundColor(type),
      height: height!,
      cornerRadius: 5,
      borderColor: _getBorderColor(type),
      borderWidth: 1,
      onPressed: onPressed,
    );
  }
}

class MyRawButtonIcon extends StatelessWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  final double height;
  final double cornerRadius;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onPressed;
  final Widget icon;

  const MyRawButtonIcon(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.textColor,
      required this.backgroundColor,
      required this.height,
      required this.cornerRadius,
      required this.borderColor,
      required this.borderWidth,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        onPrimary: textColor, backgroundColor: backgroundColor,
        minimumSize: const Size(100, 60),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
            side: BorderSide(color: borderColor, width: borderWidth)),
      ),
      onPressed: onPressed,
      label: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor,
          fontFamily: 'Poppins'
        )
      ),
      icon: icon,
    );
  }
}

class WLButtonIcon extends StatelessWidget {
  final String name;
  final MyButtonType type;
  final VoidCallback onPressed;
  final Widget iconData;
  final double? height;

  const WLButtonIcon(
      {Key? key,
      required this.name,
      required this.type,
      required this.onPressed,
      required this.iconData,
      this.height = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRawButtonIcon(
        onPressed: onPressed,
        name: name,
        textColor: _getTextColor(type),
        backgroundColor: _getBackgroundColor(type),
        height: height!,
        cornerRadius: 5,
        borderColor: _getBorderColor(type),
        borderWidth: 1,
        icon: iconData);
  }
}
