import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/models/carousel_item_model.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:url_launcher/url_launcher.dart';


List<CarouselItemModel> carouselItems(
        double carouselContainerHeight, BuildContext context) =>
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Mobile Engineer".toUpperCase(),
                      style: GoogleFonts.josefinSans(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      "Damian Tochukwu".toUpperCase(),
                      style: GoogleFonts.josefinSans(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        letterSpacing: 2.3,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Software Engineer, ",
                          style: TextStyle(
                            color: kCaptionColor,
                            fontSize: 15.0,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.location_on,
                          color: kCaptionColor,
                          size: 14,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Lagos, Nigeria",
                          style: TextStyle(
                            color: kCaptionColor,
                            fontSize: 15.0,
                            height: 1.0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28.0,
                      ),
                      child: TextButton(
                        onPressed: () {
                          openWhatsApp(
                            phoneNumber: '+2348066855471',
                            message: "Hello Damian!\nI got your contact from your website.\nLet's talk",
                          );
                        },
                        child: Text(
                          "Let's Talk",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox(
                    height: 70,
                    child: Consumer(builder: (context, ref, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: AppConstants.socialLoginDatas
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    onTap: e.onTap,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.all(5),
                                      child: Center(
                                        child: FaIcon(
                                          e.iconData,
                                          color: MyThemes.lightTheme.scaffoldBackgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
        image: Image.asset(AppConstants.guySvg,),
      ),
    );

Future<void> openWhatsApp({
  required String phoneNumber,
  String message = '',
}) async {
  final encodedMessage = Uri.encodeComponent(message);
  final url = Uri.parse("https://wa.me/$phoneNumber?text=$encodedMessage");

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch WhatsApp';
  }
}