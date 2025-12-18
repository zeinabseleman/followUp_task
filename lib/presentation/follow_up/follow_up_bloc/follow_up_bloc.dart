import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/follow_up/model/follow_up_model.dart';
import '../../../domain/follow_up/repo_interfaces/follow_up_repo.dart';
part 'follow_up_event.dart';
part 'follow_up_state.dart';

class FollowUpBloc extends Bloc<FollowUpEvent, FollowUpState> {
  FollowUpBloc(this._followUpRepo) : super(FollowUpInitial()) {
    on<GetFollowUpsEvent>((event, emit) async {
      await getFollowUps(event, emit);
    });

    on<SearchFollowUpsEvent>((event, emit) async {
      await searchFollowUps(event, emit);
    });

    on<FilterByStatusEvent>((event, emit) async {
      await filterByStatus(event, emit);
    });

  }

  final FollowUpRepo _followUpRepo;

  List<FollowUpModel> filterList = [];
  List<FollowUpModel> followUpsList = [];

  Future getFollowUps(GetFollowUpsEvent event, emit) async {
    if (event.loading == true) {
      emit(FollowUpsLoadingState());
    }
    final result = await _followUpRepo.getFollowUps();
    followUpsList = result;
    emit(FollowUpsLoadedState(followUps: followUpsList));
  }

  Future searchFollowUps(SearchFollowUpsEvent event, emit) async {
    emit(FollowUpsLoadingState());
    final result = await _followUpRepo.searchFollowUps(event.query,
        filterList.isEmpty? followUpsList : filterList);
    emit(FollowUpsLoadedState(followUps: result));
  }

  Future filterByStatus(FilterByStatusEvent event, emit) async {
    emit(FollowUpsLoadingState());
    final result = await _followUpRepo.filterByStatus(event.status);
    filterList = result;
    emit(FollowUpsLoadedState(followUps: filterList));
  }

}

