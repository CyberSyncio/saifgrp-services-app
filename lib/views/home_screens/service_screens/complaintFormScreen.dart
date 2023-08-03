// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/view_model/controller/request_controller/request_controller.dart';
import 'package:myapp/views/home_screens/service_screens/service_screen_component/complaint_form_field.dart';
import '../../../../utils/utils.dart';

class ComplaintFormScreen extends StatefulWidget {
  const ComplaintFormScreen({super.key});

  @override
  State<ComplaintFormScreen> createState() => _ComplaintFormScreenState();
}

class _ComplaintFormScreenState extends State<ComplaintFormScreen> {
  TextEditingController dateinput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    Get.put(RequestController());

    dateinput.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.now()); //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x7f000000)),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: ffem * 200,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Color(0xff436eee),
            ),
            child: SizedBox(
              height: 137,
              width: 159,
              child: Image.asset(
                  'assets/page-1/images/e88750-59a0-4195-99e9-a2554d3ed0e9-removebg-preview-1-RSR.png'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(
                  context,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 100 * fem,
              ),
              Text(
                'Request Form ',
                style: SafeGoogleFont(
                  'montserrat',
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff1f2c34),
                ),
              ),
            ],
          ),
          SizedBox(height: 20 * fem),
          Expanded(
            child: GetBuilder<RequestController>(
                init: RequestController(),
                builder: (controller) {
                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ComplaintFormField(
                            fem: fem,
                            ffem: ffem,
                            title: 'Flat no',
                            hint: 'AB23',
                            icon: Icons.apartment_rounded,
                            keyboardType: TextInputType.name,
                            controller: controller.flatNoController.value,
                            focusNode: controller.flatNoFocusNode.value,
                          ),
                          ComplaintFormField(
                            fem: fem,
                            ffem: ffem,
                            title: 'Phone No',
                            hint: '0300000000',
                            icon: Icons.phone,
                            keyboardType: TextInputType.number,
                            controller: controller.phoneNoController.value,
                            focusNode: controller.phoneNoFocusNode.value,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                31.14 * fem, 0 * fem, 42 * fem, 33.94 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date',
                                  style: SafeGoogleFont(
                                    'Montserrat',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2175 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                                Container(
                                  height: 60 * fem,
                                  padding: const EdgeInsets.only(left: 7),
                                  margin: const EdgeInsets.only(top: 7),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    border: Border.all(
                                        color: const Color(0xffd3d1d9)),
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: dateinput,
                                    decoration: const InputDecoration(
                                        suffixIcon:
                                            Icon(Icons.date_range_outlined),
                                        border: InputBorder.none),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101));

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);

                                        setState(() {
                                          dateinput.text = formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ComplaintFormField(
                            fem: fem,
                            ffem: ffem,
                            title: 'Description',
                            hint: '',
                            icon: Icons.apartment_rounded,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            controller: controller.descriptionController.value,
                            focusNode: controller.descriptionFocusNode.value,
                          ),
                          SizedBox(height: 30 * ffem),
                          Obx(
                            () => InkWell(
                              onTap: () async {
                                if (controller.loading.value) {
                                } else {
                                  await controller.requestApi();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 360 * fem,
                                height: 45 * fem,
                                decoration: BoxDecoration(
                                  color: const Color(0xff436eee),
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x3f000000),
                                      offset: Offset(0 * fem, 4 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: controller.loading.value
                                    ? const Center(
                                        child: SpinKitCircle(
                                            size: 24, color: Colors.white))
                                    : Text(
                                        'Submit',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 18 * ffem,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2175 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 10 * fem),
        ],
      ),
    ));
  }

  _datePicker() {
    return DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
  }
}
