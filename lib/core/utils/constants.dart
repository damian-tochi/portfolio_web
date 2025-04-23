import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/header_item.dart';

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class AppConstants {
  static const linkedInUrl = "https://www.linkedin.com/in/nkwocha-damian-tochukwu/";
  static const githubUrl = "https://github.com/damian-tochi";
  static const resumeUrl = "https://docs.google.com/document/d/1dhz-IGUwOKq_VPqn_MPeOAfeZo9d_wUfPwhNKBl0-Hw/edit?usp=drive_link";

  static const _assets = "assets/";
  static const _outputs = "outputs/";
  static const _images = _assets + "images/";

  static const _svg = "${_assets}svg/";
  static const guySvg = "${_svg}android-avatar.png";
  static const person = "${_images}image.png";

  
  static const _techImages = "${_images}technology/";
  static const flutterImage = _techImages + "flutter.png";
  static const pythonImage = _techImages + "python.png";
  static const phpImage = _techImages + "php.png";
  static const flaskImage = _techImages + "flask.png";
  static const firebaseImage = _techImages + "firebase.png";
  static const razorPayImage = _techImages + "razorpay.png";
  static const cPlusImage = _techImages + "c++.png";
  static const swiftImage = _techImages + "swift.png";
  static const sceneKitImage = _techImages + "scenekit.jpeg";
  static const javascriptImage = _techImages + "javascript.png";
  static const javaImage = _techImages + "java.png";
  static const androidImage = _techImages + "android_icon.png";
  static const kotlinImage = _techImages + "kotlin_Icon.png";
  static const nestJsImage = _techImages + "nestjs-logo.png";


  static const _projectsImages = _images + "projects/";
  static const stararrivalHotel = _projectsImages + "1.png";
  static const uduxImage = _projectsImages + "2.png";
  static const gryndApp = _projectsImages + "3.png";
  static const delonifera = _projectsImages + "4.png";
  static const mySchoolLibImage = _projectsImages + "5.png";
  static const blueCallImage = _projectsImages + "6.png";
  static const hycabImage = _projectsImages + "7.jpeg";
  static const pythonDocumentAnalyserImage = _projectsImages + "8.png";

  static const _gifs = _outputs + "gif/";
  static const portfolioGif = _gifs + "mobile.gif";

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: "Email",
        iconData: Icons.mail_outline_rounded,
        onTap: () {
          Utilty.openMail();
        }),
    NameOnTap(
        title: "LinkedIN",
        iconData: FontAwesomeIcons.linkedinIn,
        onTap: () {
          Utilty.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: "Github",
        iconData: FontAwesomeIcons.github,
        onTap: () {
          Utilty.openUrl(githubUrl);
        }),
    NameOnTap(
        title: "CV",
        iconData: Icons.article,
        onTap: () {
          Utilty.openUrl(resumeUrl);
        }),
  ];
}
