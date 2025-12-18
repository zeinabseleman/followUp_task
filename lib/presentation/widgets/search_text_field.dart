import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followup_task/constants/app_colors.dart';


class SearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String query)? onSearchTap;
  final TextEditingController searchController;

  const SearchTextField({super.key, this.onSearchTap,
    required this.searchController,
    required this.hintText, this.controller, this.onChanged,
    this.prefixIcon, this.suffixIcon,
    this.validator});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autofocus: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style:BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style:BorderStyle.none),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style:BorderStyle.none),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style:BorderStyle.none),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style:BorderStyle.none),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        hintText:  widget.hintText,
        fillColor: whiteColor,
        hintStyle: TextStyle(fontSize: 15.sp, color: hintColor),
        filled: true,
        errorStyle: TextStyle(fontSize: 12.sp),
        prefixIcon: widget.prefixIcon?? Icon(Icons.search,color: hintColor),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.h,minWidth: 30.w),
        suffixIcon: widget.suffixIcon ,
      ),
      onChanged: widget.onChanged as void Function(String)?,
    );
  }
}
