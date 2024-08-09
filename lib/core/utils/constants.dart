import 'package:flutter/material.dart';

const currency = "₦";
const zero = "${currency}0.00";

/// The default border radius used throughout the app.
const kShapeBorder = RoundedRectangleBorder(borderRadius: kBorderRadius);
const kRadius = Radius.circular(16);
const kPadding = 16;

const kRadius2 = Radius.circular(24);
const kBorderRadius = BorderRadius.all(kRadius);
const kSharpBorderRadius = BorderRadius.all(Radius.circular(40));
const kBorderRadiusTop = BorderRadius.only(topLeft: kRadius, topRight: kRadius);
const kBorderRadiusBottom =
    BorderRadius.only(bottomLeft: kRadius, bottomRight: kRadius);

/// The default animation durations.
const kShortAnimationDuration = Duration(milliseconds: 300);
const kLongAnimationDuration = Duration(milliseconds: 600);

/// The default fonts.
const kFontFamily = 'Satoshi';

const kWhite = Colors.white;
const kBlack = Color(0xFF000000);
const kDropdownColor = Color.fromARGB(255, 253, 249, 249);
const kScreenBGColor = Color(0xFFE7E7E7);
const kPrimaryColor = Color(0xFF575FF2);
const kActiveColor = Color(0xFF37B2FF);
const kSecondaryColor = Color(0xFFD6EFFF);
const kDarkTextColor = Color(0xFF221D5E);
const kHomeTabItemColor = Color(0xFFF2F2FD);

const kBottomTabColor = Color(0xFF2B2B2B);

const kLocationTabColor = Color(0xFF737373);

const kMenuTabColor = Color(0xFFFBF5EB);

const kRentColor = Color(0xFFA5967E);

const kBottomContainerTabColor = Color(0xFF232220);

const kBottomContainerSwicthTabColor = Color(0xFFFC9E10);

const kHomeScreenBackgroundColor = Color(0xFFF9E5CD);

const kHomeScreenBackgroundColor2 = Color(0xFFA5957E);

const kAmountContainerColor = Color(0xFFFC9E10);

const kSliderBgColor = Color(0xFFDBC9BA);

const kTextPrimary = Color(0xFFA5967E);

const kTextPrimary2 = Color(0xFFA4A19B);

const kTextPrimary3 = Color(0xFFFCA72E);

const kStrokeBorderColor = Color.fromRGBO(210, 210, 210, 0.25);

const kSecondaryColorVariant = Color(0xFF676391);
const kContrastColor = Color(0xFF101010);
const kCheckBoxColor = Color.fromRGBO(87, 95, 242, 1);
const kSecondaryContrastColor = Color(0xFF0F0F0F);
const kStrokeColor = Color.fromRGBO(204, 207, 255, 0.56);

const kStepperColor = Color(0xFFF2F2F2);
const kProfilePicColor = Color(0xFF575FF2);
const kShadowColor = Color.fromRGBO(194, 194, 194, 0.32);
const kIndicatorColor = Color(0xFF9490BB);
const kErrorColor = Color(0xFFFF4242);
const kSuccessColor = Color(0xFF4BA671);
const kDarkGreyColor = Color(0xFF3E3E3E);
const kGreenColor = Color(0xFF008F53);
const kLightGreenColor = Color(0xFF07BF72);
const kLightGreyColor = Color(0xFF626262);
const kOutlineShadowColor = Color(0xFFC5C5C5);
const kOffPrimaryColor = Color(0xFFEDF6FB);
const kTickColor = Color(0xFF8F8F8F);
const kCupertinoSwitchColor = Color.fromRGBO(91, 171, 10, 1);
const kBubbleGrey = Color(0xFFF0F0F0);
const kIconGrey = Color(0xFF8F8F8F);
const kPendingColor = Color(0xFFF8861D);
const kInfoColor = Color(0xFFC3FDE5);
const kInfoActionColor = Color(0xFF02844D);
const kDisabledColor = Color(0xFFD9D9D9);
const kSentColor = Color(0xFFD6FFE4);
const kPremiumColor = Color(0xFFE1FDF1);
const kOrangeAccentColor = Color(0xFFFFECEC);
const kOrangeLightAccentColor = Color(0xFFFEF4EA);
const kGreyAccentColor = Color.fromRGBO(255, 255, 255, 0.5);
const kGrey7 = Color(0xFFD3DCE6);
const kGrey4 = Color(0xFF575A65);
const kPurple = Color.fromRGBO(91, 39, 175, 0.1);
const kGreen = Color.fromRGBO(31, 230, 129, 0.1);
const kPink = Color.fromRGBO(255, 129, 203, 0.1);

const successCodes = <int, String>{
  200: "OK",
  201: "Created",
  202: "Accepted",
  203: "Non-Authoritative Information",
  204: "No Content",
  205: "Reset Content",
  206: "Partial Content",
  207: "Multi-Status",
  208: "Already Reported",
  226: "IM Used"
};
