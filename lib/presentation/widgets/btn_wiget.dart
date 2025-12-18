import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:followup_task/presentation/widgets/custom_text.dart';
import '../../constants/app_colors.dart';

class BtnWidget extends StatelessWidget {
  final String? txt;
  final VoidCallback onClicked;
  final Color? colorBtn;
  final Color? colorTxt;
  final double? width;
  final double? height;
  final double? radius;
  final  bool? isIcon;
  final  String? icon;

  const BtnWidget(
      {super.key,
       this.txt,
       this.width,
       this.height,
      required this.onClicked,
       this.colorBtn,
       this.colorTxt,
      this.radius ,
        this.isIcon = false, this.icon,

      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorBtn ?? redColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              side: BorderSide(
                  width: 1,
                  color: transparent
                  )),
        ),
        child:
        isIcon == false
        ?CustomText(
          text : txt ??'',
          color: colorTxt ?? whiteColor ,
        )
            :SvgPicture.asset(icon!)
      ),
    );
  }
}
