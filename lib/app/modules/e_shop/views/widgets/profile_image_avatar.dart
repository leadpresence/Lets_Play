import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileCircleAvatar(
    context, {
      required String image,
    }) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .255,
    child: Column(
      children: [
        Container(
          height: 94,
          width: 94,
          margin: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.orange,
            ),
            color: Colors.white12,
          ),
          child: Center(
            child:

            image.isEmpty?
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white12,
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ):
            Container(
              height: 94,
              width: 94,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/package.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
