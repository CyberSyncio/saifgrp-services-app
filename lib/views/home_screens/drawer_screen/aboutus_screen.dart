// import 'package:flutter/material.dart';

// class AboutScreen extends StatelessWidget {
//   const AboutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.toNamed(RoutesName.homeScreen),
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
          ),
          backgroundColor:
              AppColor.kbackGroundColor, // Customize the app bar color

          title: Text('About Us',
              style: GoogleFonts.firaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: AppColor.whiteColor)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Saif Group',
                    style: GoogleFonts.firaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed sagittis velit eu ultrices ultrices. Phasellus feugiat '
                  'magna in elementum congue. Donec sit amet leo vitae massa '
                  'consequat tincidunt. Pellentesque id tortor in justo '
                  'tincidunt congue. Nunc varius lorem et nisl faucibus, eget '
                  'vestibulum metus aliquet. Duis interdum tortor et purus '
                  'imperdiet, non tincidunt neque volutpat. Cras at efficitur '
                  'leo, eu aliquet tortor. Sed lacinia feugiat feugiat. '
                  'Vestibulum dapibus dolor sed posuere porttitor. Nullam '
                  'sodales ultrices quam ac sagittis. Donec volutpat enim non '
                  'metus pellentesque tristique. Morbi ac nunc id ipsum '
                  'porta accumsan. Fusce mattis ex sed sem facilisis, at '
                  'malesuada enim laoreet. Integer rhoncus nunc ac volutpat '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed sagittis velit eu ultrices ultrices. Phasellus feugiat '
                  'magna in elementum congue. Donec sit amet leo vitae massa '
                  'consequat tincidunt. Pellentesque id tortor in justo '
                  'tincidunt congue. Nunc varius lorem et nisl faucibus, eget '
                  'vestibulum metus aliquet. Duis interdum tortor et purus '
                  'imperdiet, non tincidunt neque volutpat. Cras at efficitur '
                  'leo, eu aliquet tortor. Sed lacinia feugiat feugiat. '
                  'Vestibulum dapibus dolor sed posuere porttitor. Nullam '
                  'sodales ultrices quam ac sagittis. Donec volutpat enim non '
                  'metus pellentesque tristique. Morbi ac nunc id ipsum '
                  'porta accumsan. Fusce mattis ex sed sem facilisis, at '
                  'malesuada enim laoreet. Integer rhoncus nunc ac volutpat '
                  'auctor. Morbi in justo nisi.',
                  style: GoogleFonts.firaSans(
                    fontSize: 16,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
