import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

Widget serviceContainer(
    {required double fem,
    required double ffem,
    required int serviceId,
    required String img,
    required String name}) {
  return InkWell(
    onTap: () => Get.toNamed(RoutesName.complaintFormScreen,
        arguments: serviceId.toString()),
    child: Container(
      width: 90 * fem,
      height: 90 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff436eee)),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
            width: double.infinity,
            height: 45 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.5 * fem),
              color: const Color(0xffffffff),
            ),
            child: Image.network(img),
          ),
          Text(
            // menCU9 (I37:738;55:304)
            name,
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              'Inter',
              fontSize: 14.273683548 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2125 * ffem / fem,
              color: const Color(0xff1f2c34),
            ),
          ),
        ],
      ),
    ),
  );
}
