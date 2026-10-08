import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fields extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? title;
  final double? width;
  final bool isPassword;
  const Fields({
    this.width,
    super.key,
    this.title,
    required this.isPassword,
    this.controller,
    this.validator,
  });

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  bool change = true;

  @override
  void initState() {
    super.initState();
    change = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 351.w,

      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: change,
        decoration: InputDecoration(
          hintText: widget.title ?? "",
          hintStyle: AppStyles.grey16w4009,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0xFFE8ECF4), width: 1.w),
          ),
          fillColor: Color(0xFFF7F8F9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.blueColor, width: 1.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      change = !change;
                    });
                  },
                  icon: Icon(
                    change ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.greyColor8,
                    size: 20.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
