import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';

screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

purpleLageButton(String text, Function onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: CupertinoButton(
        color: purple,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ),
        onPressed: () => {onpressed},
      ),
    );

orangeLageButton(String text, VoidCallback onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: CupertinoButton(
        color: orange,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ),
        onPressed: () => onpressed,
      ),
    );

borderLageButton(String text, Function onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: OutlinedButton(
        child: Text(
          text,
          style: const TextStyle(color: purple),
        ),
        onPressed: () => {onpressed},
      ),
    );
