
import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/gateway/tasks_gateway.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_usecase.dart';

final tasksApi = TasksApi();
final tasksGateway = TasksGateway(tasksApi);
final tasksUsecase = TasksUsecase(tasksGateway);