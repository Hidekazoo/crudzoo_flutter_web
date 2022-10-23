
class Task {
  final String subject;
  final String link;
  final String body;

  Task(this.subject, this.link, this.body);

  @override
  int get hashCode => Object.hashAll([subject,link,body]);

  @override
  bool operator == (Object other) {
    return (other is Task) && subject == other.subject &&
            link == other.link &&
            body == other.body;
  }
}