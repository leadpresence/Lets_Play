import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryCircleAvatar(
  context, {
  required String image,
  category,
}) {
  return SizedBox(
    // width: MediaQuery.of(context).size.width * .566,
    height: MediaQuery.of(context).size.height * .255,
    child: Column(
      children: [
        Container(
          height: 64,
          width: 64,
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
            child: Container(
              height: 48,
              width: 48,

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
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          child: Text(
            category.toString(),
            style: GoogleFonts.mulish(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 8.5,
              letterSpacing: -.2,
            ),
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
