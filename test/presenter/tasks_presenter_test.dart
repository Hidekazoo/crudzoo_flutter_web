import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/presenter/tasks_presenter.dart';
import 'package:crudzoo_flutter_web/view/provider/tasks.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';


void main() {
  group('tasks_presenter', () {
    test('set_tasks', () {
      final tasks = [
        const Task("test_id", "test_subject", "test_link", "test_body")
      ];
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final target = container.read(TasksPresenter.provider);
      target.setTasks(tasks);
      final actual = container.read(tasksProvider.notifier).getTasks();
      const expected = [
        ViewTask("test_id", "test_subject", "test_link", "test_body")
      ];
      expect(actual, expected);
    });
  });
}
