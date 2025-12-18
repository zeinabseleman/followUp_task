import 'package:followup_task/data/follow_up/model/follow_up_model.dart';
import 'package:followup_task/domain/follow_up/repo_interfaces/follow_up_repo.dart';

class FollowUpRepoImpl implements FollowUpRepo {
  List<FollowUpModel> followUpData = [
    FollowUpModel(
      id: 1,
      title: 'Call customer',
      description: 'Call customer , Call customer ',
      customerName: 'Zeinab Seleman',
      type: 'call',
      status: 'completed',
    ),
    FollowUpModel(
      id: 2,
      title: 'Meeting with customer',
      description: 'Meeting with customer,Meeting with customer',
      customerName: 'Mohamed ',
      type: 'meeting',
      status: 'scheduled',
    ),
    FollowUpModel(
      id: 3,
      title: 'Visit',
      description: 'customer visit',
      type: 'visit',
      status: 'No Status',
    ),
  ];

  @override
  Future<List<FollowUpModel>> getFollowUps()  async {
    //call api if exist
    return  followUpData;
  }

  @override
  Future<List<FollowUpModel>> searchFollowUps(String query,List<FollowUpModel> searchList) async {
    final searchKey = query.toLowerCase();
    if (searchKey.isEmpty) return searchList;
    return searchList.where((item) {
      final title = item.title?.toLowerCase() ?? '';
      final customerName = item.customerName?.toLowerCase() ?? '';
      return title.contains(searchKey) || customerName.contains(searchKey);
    }).toList();
  }

  @override
  Future<List<FollowUpModel>> filterByStatus(String? status) async{
    if (status == null || status =='all') return followUpData;
    return followUpData
        .where((item) => item.status == status)
        .toList();
  }
}


