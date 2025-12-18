import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followup_task/presentation/widgets/search_text_field.dart';
import '../../constants/app_colors.dart';
import 'components/filter_widget.dart';
import 'components/follow_ups_list.dart';
import 'follow_up_bloc/follow_up_bloc.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grayBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  FilterWidget(),
                  SizedBox(width: 5.w,),
                  Expanded(
                    child: SearchTextField(
                      searchController: searchController,
                      hintText: 'search here',
                      onChanged: (val) {
                        context.read<FollowUpBloc>().add(
                            SearchFollowUpsEvent(query: val));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              FollowUpsList()
            ],
          ),
        ),
      ),
    );
  }
}
