
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final TaskContent taskContent;
  const Task(this.id, this.taskContent);

  @override
  List<Object> get props => [id, taskContent];
}

class TaskContent extends Equatable {
  final String subject;
  final String link;
  final String body;

  const TaskContent(this.subject,this.link,this.body);

  @override
  List<Object?> get props => [subject,link,body];
}