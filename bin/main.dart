import 'dart:convert';

class Professors {
  List<Map<String, String>> people;

  Professors(this.people);

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<Map<String, dynamic>> decodedJson = List<Map<String, dynamic>>.from(jsonDecode(json));
  
  List<Map<String, String>> peopleList = decodedJson.map((person) {
    return person.map((key, value) => MapEntry(key, value.toString()));
  }).toList();

  Professors professors = Professors(peopleList);

  professors.sort('first');
  print('Sorted by first name:');
  professors.output();

  professors.plus({"first":"John", "last":"Doe", "email":"john.doe@example.com"});
  print('\nAfter adding a new person:');
  professors.output();

  professors.remove('first', 'Steve');
  print('\nAfter removing Steve:');
  professors.output();
}