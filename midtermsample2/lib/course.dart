class Course {
  String _code;
  String _title;
  int _credit;

  Course(this._code, this._title, this._credit);

  String toString() {
    return 'Code:$_code';
  }

  String getInfo() {
    return """
   Code:$_code
   Title: $_title
   Credits: $_credit
 """;
  }
}

List<Course> courses= [
   Course("CS101", "Computer Programming", 3),
   Course("MATH245", "Calculus  II", 3),
  Course("PHYS267", "Physics I", 3),
  
];
