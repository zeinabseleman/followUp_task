// service locator
import 'package:get_it/get_it.dart';
import '../data/follow_up/repo_impl/follow_up_repo_impl.dart';
import '../domain/follow_up/repo_interfaces/follow_up_repo.dart';

final serviceLocator = GetIt.instance;

Future<void> initDI() async {
  serviceLocator.registerLazySingleton<FollowUpRepo>(
    () => FollowUpRepoImpl(),
  );
}
