import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/presenter/tasks_presenter.dart';
import 'package:crudzoo_flutter_web/repository/tasks_repository.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_usecase.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final tasksProvider =
    StateNotifierProvider.autoDispose<TasksNotifier, List<ViewTask>>((ref) {
  return TasksNotifier();
});

final tasksPresenter = Provider.autoDispose((ref) {
  return TasksPresenter(ref);
});

final tasksUsecaseProvider = Provider.autoDispose((ref) {
  final presenter = ref.watch(tasksPresenter);
  final tasksApi = TasksApi();
  final tasksGateway = TasksGateway(tasksApi);
  return TasksUsecaseImpl(tasksGateway, presenter);
});
