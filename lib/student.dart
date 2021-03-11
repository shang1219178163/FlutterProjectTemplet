class StudentClassroom{
    //JsonName:name
    String name;

    //JsonName:id
    int id;

    StudentClassroom({
      this.name,
      this.id
    });
  }

  class StudentTeachers{
    //JsonName:name
    String name;

    //JsonName:age
    int age;

    StudentTeachers({
      this.name,
      this.age,
    });
  }

  class Student{
    //JsonName:score
    int score;

    //JsonName:teachers
    List<StudentTeachers> teachers;

    //JsonName:name
    String name;

    //JsonName:classroom
    StudentClassroom classroom;

    //JsonName:id
    String id;

    Student({
      this.score,
      this.teachers,
      this.name,
      this.classroom,
      this.id,
    });
}

extension de on String{
  
}