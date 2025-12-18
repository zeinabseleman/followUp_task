part of 'follow_up_bloc.dart';

@immutable
abstract class FollowUpState {}

class FollowUpInitial extends FollowUpState {}

class FollowUpsLoadingState extends FollowUpState {}
class FollowUpsLoadedState extends FollowUpState {
  List<FollowUpModel> followUps;
  FollowUpsLoadedState({required this.followUps});
}
class FollowUpFailedState extends FollowUpState {
  final String errorMsg;
  FollowUpFailedState(this.errorMsg);
}
