// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/request_controller/request_controller.dart';

class RequestScreen extends StatelessWidget {
  final RequestController _complaintController = Get.put(RequestController());
  final _formKey = GlobalKey<FormState>();

  RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.kbackGroundColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            'File a Complain',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * .02),
                Text(
                  'Kindly describe your issue/problem.',
                  style: GoogleFonts.firaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.kbackGroundColor,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller:
                          _complaintController.descriptionController.value,
                      focusNode:
                          _complaintController.descriptionFocusNode.value,
                      maxLines: 20,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Utils.snackBar("Missing",
                              "Fields must not be empty", action: "error");
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Electrical malfunction in the house: Need a qualified electrician to inspect and fix the wiring issue',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => RequestButton(
                    title: "Submit",
                    onPressed: _complaintController.loading.value
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _complaintController.requestApi();
                              _complaintController.descriptionController.value
                                  .clear();
                            } else {
                              Utils.snackBar(
                                  'Request ', 'Kindly Enter Description');
                            }
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
