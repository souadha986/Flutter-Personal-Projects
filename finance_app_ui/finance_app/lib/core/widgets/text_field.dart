import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fields extends StatefulWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? title;
  bool isPassword;
  Fields({
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
      width: 331.w,

      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: change,
        decoration: InputDecoration(
          hintText: widget.title ?? "",
          hintStyle: Fontstyle.secondaryfontstylegrey,
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xFFE8ECF4), width: 1.w),
          ),
          fillColor: Color(0xFFF7F8F9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
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
                  icon: Icon(change ? Icons.visibility : Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
