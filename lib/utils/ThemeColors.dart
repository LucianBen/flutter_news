import 'dart:ui';

class ThemeColors {
  ///主背景色
  static Color colorBackground = const Color(0xFFF5F5F5);

  ///bottom点击后色调
  static Color colorTheme = const Color(0xFFFF454B);

  ///纯白色
  static Color colorWhite = Color.fromARGB(255, 255, 255, 255);

  ///纯黑色
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);

  ///灰色
  static Color colorGrey = const Color(0xFFF5F5F5);
  static Color colorGrey_1 = const Color(0xFF818181);
  static Color colorGrey_2 = const Color(0xCC818181);
  static Color colorGrey_8 = const Color(0x00dedede);
  static Color colorGrey_9 = const Color(0xFF999999);
  static Color colorGrey_10 = const Color(0xFFDCDCDC);

  ///提示性文字，状态信息，按钮等
  static Color colorRed = Color.fromARGB(255, 226, 36, 39);

  static Color colorPink = const Color(0xFFFFEAF1);

  static Color colorGreen = const Color(0xFF11D371);

  ///主色调，按钮，特殊需要强调和突出的文字
//  static Color colorTheme = Color.fromARGB(255, 255, 134, 0);

  ///主色调渐变用色，个别按钮和状态，从colorBtnLeft变化到colorBtnRight
  static Color colorBtnLeft = Color.fromARGB(255, 251, 156, 51);
  static Color colorBtnRight = Color.fromARGB(255, 252, 191, 50);

  ///功能性较强的文字，内页标题等
  static Color color333333 = Color.fromARGB(255, 51, 51, 51);

  ///正文，副标题以及可点击区域的主要文字和图标
  static Color color666666 = Color.fromARGB(255, 102, 102, 102);

  ///弱化信息，提示性文字信息，不可点击状态
  static Color color999999 = Color.fromARGB(255, 153, 153, 153);

  ///弱化信息，提示性文字信息
  static Color colorDDDDDD = Color.fromARGB(255, 221, 221, 221);

  ///背景区域划分，分割线
  static Color colorF6F6F8 = Color.fromARGB(255, 246, 246, 248);
}
