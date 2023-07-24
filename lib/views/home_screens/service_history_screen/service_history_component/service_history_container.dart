import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

Widget serviceHistoryScreenContainer(
    {required double fem,
    required double ffem,
    required String img,
    required String title,
    required String subtitle}) {
  return Container(
    // group97XHj (40:589)
    margin: EdgeInsets.fromLTRB(26 * fem, 0 * fem, 23.54 * fem, 6.01 * fem),
    padding:
        EdgeInsets.fromLTRB(11.43 * fem, 9.24 * fem, 17.54 * fem, 14.77 * fem),
    width: double.infinity,
    height: 132 * fem,
    decoration: BoxDecoration(
      color: const Color(0xfff5f5f5),
      borderRadius: BorderRadius.circular(20 * fem),
    ),
    child: Container(
      // group96bHb (40:591)
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            // unsplash1c8sj2io2i4R1j (40:592)

            width: 85.31 * fem,
            height: 107.99 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * fem),
              color: const Color(0xffffffff),
            ),
            child: Image.network(img),
          ),
          Container(
            // group95tAD (40:593)
            margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
            width: 240 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10 * fem),
                Text(
                  title,
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w800,
                    height: 1.2175 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  "Date : $subtitle",
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.2175 * ffem / fem,
                    color: const Color(0x7f000000),
                  ),
                ),
                SizedBox(height: 10 * fem),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
