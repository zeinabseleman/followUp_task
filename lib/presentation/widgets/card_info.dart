import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import 'custom_text.dart';

class CardInfo extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const CardInfo({
    super.key,
    required this.label,
    required this.value, this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          CustomText(
            text: '$label : ',
          ),
          Expanded(
            child: CustomText(
              text: value,
              fontSize: 13.sp,
              color: valueColor ?? hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
