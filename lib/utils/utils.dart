import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followup_task/presentation/widgets/custom_text.dart';

import '../constants/app_colors.dart';

class Utils {

  static Color followUpStatusColor(String status) {
    switch (status) {
      case "completed":
        return  completedStatusColor;
      case "scheduled":
        return  scheduledStatusColor;
      default:
        return redColor;
    }
  }

  static void filterBottomSheet(
      {required BuildContext context,
        required Widget Function(void Function(void Function()) setModalState) builder,
       }) async {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      backgroundColor: grayBackgroundColor,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
          builder: (context, setModalState) {
            return
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          icon: Icon(Icons.close, size: 25.w, color: redColor,
                          )),
                      Expanded(
                        child: Center(
                          child: CustomText(
                            text: 'Filter By Status',
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child:  builder(setModalState),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }


  static List<String> status = [
    'all',
    'completed',
    'scheduled',
    'No Status'
  ];

}
