part of 'follow_up_bloc.dart';

@immutable
abstract class FollowUpEvent {}
class GetFollowUpsEvent extends FollowUpEvent {
  bool? loading;
  GetFollowUpsEvent({this.loading = true});
}

class SearchFollowUpsEvent extends FollowUpEvent {
  String query;
  SearchFollowUpsEvent({required this.query});
}

class FilterByStatusEvent extends FollowUpEvent {
  String? status;
  FilterByStatusEvent({this.status});
}

