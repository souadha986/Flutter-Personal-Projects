import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/core/styling/app_colors.dart';
import 'package:shopping/core/styling/app_styles.dart';

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
          labelText: widget.title,
          floatingLabelBehavior: FloatingLabelBehavior.auto, // default
          hintText: widget.title ?? "",
          hintStyle: AppStyles.grey11regular,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.backgroundcolor,
              width: 1.w,
            ),
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.backgroundcolor,
              width: 1.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
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
                    color: AppColors.greyColor,
                    size: 20.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
