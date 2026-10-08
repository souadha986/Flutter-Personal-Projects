import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Back extends StatelessWidget {
  final Color? bordercolor;
  final double? width;
  final double? height;
  final double? borderraduis;
  final double? iconsize;
  void Function() onPresse;

  Back({
    super.key,
    this.borderraduis,
    this.bordercolor,
    this.height,
    this.width,
    required this.onPresse,
    this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 41.w,
      height: height ?? 41.h,
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor ?? Color(0xFFE8ECF4), width: 1.w),
        borderRadius: BorderRadius.circular(borderraduis ?? 16.r),
      ),

      child: Center(
        child: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: iconsize ?? 19.w,
            color: Colors.blue,
          ),
          onPressed: onPresse,
        ),
      ),
    );
  }
}
