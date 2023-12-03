class Student {
  int _id;
  String _name;

  Student(this._id, this._name);

  @override
  String toString() {
    return '$_id \t $_name';
  }

  String getName() {
    return _name;
  }
}

List<Student> students=[
   Student(1,"John"),
   Student(2,"Jane"),
   Student(3,"Naeem"),

];
