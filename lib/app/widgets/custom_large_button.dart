  import 'package:flutter/cupertino.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';

purpleLageButton(String text, Function onpreessed) => CupertinoButton(
        color: purple,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: purple),
        ),
        onPressed: () =>onpreessed,
      );


orangeLageButton(String text, Function onpreessed) => CupertinoButton(
        color: orange,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ),
        onPressed: () =>onpreessed,
      );
