import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // نفرض LTR على الـ Scrollbar نفسه عشان يظهر على اليمين
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scrollbar(
        controller: details.controller,
        thumbVisibility: false,
        child: Directionality(
          // نرجّع RTL للمحتوى جوه عشان النص والتخطيط يفضلوا عربي
          textDirection: TextDirection.rtl,
          child: child,
        ),
      ),
    );
  }
}
