import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followup_task/constants/app_colors.dart';
import 'package:followup_task/presentation/widgets/custom_text.dart';

import '../../data/follow_up/model/follow_up_model.dart';
import '../../utils/utils.dart';
import 'card_info.dart';

class FollowUpCard extends StatelessWidget {
  final FollowUpModel followUps;
  const FollowUpCard({super.key, required this.followUps});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 2,
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardInfo(label: 'ID', value: '${followUps.id}'),
            CardInfo(label: 'Title / Subject', value: '${followUps.title}'),
            CardInfo(label: 'Description', value: '${followUps.description}'),
            if(followUps.customerName != null)
            CardInfo(label: 'Customer Name', value: '${followUps.customerName}'),
            CardInfo(label: 'Type', value: '${followUps.type}'),
            CardInfo(label: 'Status', value: '${followUps.status}',
            valueColor: Utils.followUpStatusColor('${followUps.status}'),
            )

          ],
        ),
      ),
    );
  }
}
