import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/follow_up_card.dart';
import '../follow_up_bloc/follow_up_bloc.dart';

class FollowUpsList extends StatelessWidget {
  const FollowUpsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FollowUpBloc, FollowUpState>(
        builder: (context, state) {
          if (state is FollowUpsLoadingState ||
              state is FollowUpInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FollowUpsLoadedState) {
            if (state.followUps.isEmpty) {
              return const Center(
                child: CustomText(text: 'no follow ups found'),
              );
            }
            return ListView.builder(
              itemCount: state.followUps.length,
              itemBuilder: (context, index) {
                return FollowUpCard(
                  followUps: state.followUps[index],
                );
              },
            );
          }
          return const Center(
            child: CustomText(text: 'something went wrong'),
          );
        },
      ),
    );
  }
}
