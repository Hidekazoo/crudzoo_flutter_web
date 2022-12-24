
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String subject;
  final String link;
  final String body;

  const Task(this.subject, this.link, this.body);

  // @override
  // int get hashCode => Object.hashAll([subject,link,body]);
  //
  // @override
  // bool operator == (Object other) {
  //   return (other is Task) && subject == other.subject &&
  //           link == other.link &&
  //           body == other.body;
  // }
  @override
  List<Object> get props => [subject, link, body];
}