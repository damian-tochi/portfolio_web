import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/footer_item.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';


final List<FooterItem> footerItems = [
  FooterItem(
      iconData: Icons.location_on,
      title: "ADDRESS",
      text1: "Ibeju-Lekki, Lagos",
      text2: "Nigeria",
      onTap: () {
        Utilty.openMyLocation();
      }),
  FooterItem(
      iconData: Icons.phone,
      title: "PHONE",
      text1: "+2348 0668 55471",
      text2: "",
      onTap: () {
        Utilty.openMyPhoneNo();
      }),
  FooterItem(
      iconData: Icons.mail,
      title: "EMAIL",
      text1: "nkwocha.damian@gmail.com",
      text2: "",
      onTap: () {
        Utilty.openMail();
      }),
  FooterItem(
      iconData: Icons.sms,
      title: "WHATSAPP",
      text1: "+2348 0668 55471",
      text2: "",
      onTap: () {
        Utilty.openWhatsapp();
      })
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Contact Me",
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                  fontSize: 35.0,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Easy ways to reach me",
                style: GoogleFonts.josefinSans(
                  color: Colors.grey[400],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: ScreenHelper.isDesktop(context) ? 40 : 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: footerItem.onTap,
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: kPrimaryColor,
                                        size: 28,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${footerItem.text2}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Developed in 💛 with Flutter",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
  );
}
