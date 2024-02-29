class Task {
  String id;
  List<String> field;
  Coordinates start;
  Coordinates end;
  List<Coordinates>? steps;
  String? path;

  Task({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
    this.steps,
    this.path,
  });

  Task copyWith({
    String? id,
    List<String>? field,
    Coordinates? start,
    Coordinates? end,
    List<Coordinates>? steps,
    String? path,
  }) {
    return Task(
      id: id ?? this.id,
      field: field ?? this.field,
      start: start ?? this.start,
      end: end ?? this.end,
      steps: steps ?? this.steps,
      path: path ?? this.path,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        field: [...json['field']],
        start: Coordinates(
          json['start']['x'],
          json['start']['y'],
        ),
        end: Coordinates(
          json['end']['x'],
          json['end']['y'],
        ),
      );
}

class Coordinates {
  int x;
  int y;

  Coordinates(this.x, this.y);
}
