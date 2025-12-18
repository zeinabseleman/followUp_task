import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/utils.dart';
import '../../widgets/btn_wiget.dart';
import '../../widgets/radio_button_widget.dart';
import '../follow_up_bloc/follow_up_bloc.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {

  String selectedVal = '';

  @override
  Widget build(BuildContext context) {
    return BtnWidget(
      width: 50.w,
      onClicked: () {
        Utils.filterBottomSheet(
            context: context,
            builder: (setModalState) => Column(
                children: [
                  ...List.generate(
                      Utils.status.length, (index) {
                    final item = Utils.status[index];
                    return RadioButtonWidget(
                      value: item,
                      selectedStatus: selectedVal,
                      onChanged: (val) {
                        setModalState(() {
                          selectedVal = val;
                        });
                      },
                    );
                  }),
                  SizedBox(height: 50.h,),
                  BtnWidget(
                    width: 150.w,
                    onClicked: () {
                      if (selectedVal.isNotEmpty) {
                        context.read<FollowUpBloc>().add(FilterByStatusEvent(status: selectedVal));
                      }
                      Navigator.pop(context);
                    },
                    txt: 'Apply Filter',

                  )
                ]
            ));
      },
      isIcon: true,
      icon: AppImages.filter,
      colorBtn: whiteColor,
    );
  }
}
