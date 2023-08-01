import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

Widget residentalContainer(
    {required double fem,
    required double ffem,
    required String img,
    required String name,
    required String location}) {
  return InkWell(
    onTap: () => Get.toNamed(RoutesName.serviceScreen, arguments: 1),
    child: Container(
      width: 107 * fem,
      height: 250 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x7f000000)),
        borderRadius: BorderRadius.circular(5 * fem),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3f000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2 * fem,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              // autogroupi8gvQpR (Vai2tWJY2VWWebxDzTi8GV)
              //  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 11.23 * fem),
              width: 200 * fem,
              height: 190 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5 * fem),
                  topRight: Radius.circular(5 * fem),
                ),
              ),
              child: Image.network(img, fit: BoxFit.fitHeight)),
          SizedBox(height: ffem * 10),
          Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Text(
              name,
              style: SafeGoogleFont(
                'montserrat',
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w800,
                height: 1.2125 * ffem / fem,
                color: const Color(0xff000000),
              ),
            ),
          ),
          SizedBox(height: ffem * 5),
          SizedBox(
            height: fem * 20,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 0,
                  child: Text(
                    location,
                    style: SafeGoogleFont(
                      'montserrat',
                      fontSize: 13 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  child: SizedBox(
                    width: 16.07 * fem,
                    height: 16.05 * fem,
                    child: Image.asset(
                      'assets/page-1/images/group-14-o6H.png',
                      width: 16.07 * fem,
                      height: 16.05 * fem,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
