
import '../../../data/follow_up/model/follow_up_model.dart';

abstract class FollowUpRepo {
  Future<List<FollowUpModel>> getFollowUps();
  Future<List<FollowUpModel>> searchFollowUps(String query,List<FollowUpModel> searchList);
  Future<List<FollowUpModel>> filterByStatus(String? status);
}
