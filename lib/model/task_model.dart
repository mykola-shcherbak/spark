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

  Task setSteps({required List<Coordinates> newSteps}) {
    return Task(id: id, field: field, start: start, end: end, steps: newSteps);
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
