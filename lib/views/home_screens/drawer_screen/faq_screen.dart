import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.toNamed(RoutesName.homeScreen),
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            'FAQs',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColor.kWhiteColor),
          ),
          backgroundColor: AppColor.kbackGroundColor,
          // shadowColor: Colors.grey.withOpacity(0.5),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            FaqItem(
              question: 'What is Saif Group?',
              answer:
                  'Saif Group is a leading conglomerate with diverse business operations in various industries.',
            ),
            FaqItem(
              question: 'How long has Saif Group been in business?',
              answer:
                  'Saif Group has been in business for over 20 years, providing top-quality products and services.',
            ),
            FaqItem(
              question: 'Where is the headquarters of Saif Group located?',
              answer: 'The headquarters of Saif Group is located in XYZ City.',
            ),
            FaqItem(
              question: 'Do you have international offices?',
              answer:
                  'Yes, Saif Group has a global presence with offices and operations in multiple countries.',
            ),
            FaqItem(
              question: 'How can I contact Saif Group for inquiries?',
              answer:
                  'You can reach out to our customer support team at any time through our website or by phone.',
            ),
            FaqItem(
              question: 'Are there career opportunities at Saif Group?',
              answer:
                  'Yes, we regularly offer career opportunities across different departments and positions.',
            ),
            FaqItem(
              question: 'Can I partner with Saif Group for business ventures?',
              answer:
                  'Saif Group welcomes strategic partnerships and collaborations. Please contact us for further details.',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 167, 209, 231),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        ),
        iconColor: AppColor.kWhiteColor,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Text(
              widget.answer,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: AppColor.kWhiteColor,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
