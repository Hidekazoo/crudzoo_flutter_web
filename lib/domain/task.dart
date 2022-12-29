
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String subject;
  final String link;
  final String body;

  const Task(this.id, this.subject, this.link, this.body);

  // @override
  // int get hashCode => Object.hashAll([subject,link,body]);
  //
  // @override
  // bool operator == (Object other) {
  //   return (other is Task) && subject == other.subject &&
  //           link == other.link &&
  //           body == other.body;
  // }

  // static create(String id, String subject, String link, String body) {
  //   return Task(id, subject, link, body);
  // }

  @override
  List<Object> get props => [id, subject, link, body];
}