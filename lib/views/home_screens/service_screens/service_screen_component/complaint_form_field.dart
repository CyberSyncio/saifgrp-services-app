import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class ComplaintFormField extends StatelessWidget {
  final double fem, ffem;
  final int maxLines;
  final String title, hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FocusNode focusNode;
  const ComplaintFormField(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.title,
      required this.hint,
      required this.icon,
      required this.keyboardType,
      this.maxLines = 1,
      required this.controller,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(31.14 * fem, 0 * fem, 42 * fem, 15 * fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: SafeGoogleFont(
              'Montserrat',
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.2175 * ffem / fem,
              color: const Color(0xff000000),
            ),
          ),
          Container(
            height: maxLines > 1 ? 130 * fem : 60 * fem,
            padding: const EdgeInsets.only(left: 7),
            margin: const EdgeInsets.only(top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * fem),
              border: Border.all(color: const Color(0xffd3d1d9)),
            ),
            child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                maxLines: maxLines,
                decoration: InputDecoration(
                    hintText: hint,
                    suffixIcon: maxLines > 1 ? null : Icon(icon),
                    border: InputBorder.none)),
          ),
        ],
      ),
    );
  }
}
