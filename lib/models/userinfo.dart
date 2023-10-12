// Defining the UserInfo class
class UserInfo {
  final String name;
  final String course;
  final String instituteName;
  final String profilePic;
  final ContactInformation contactInformation;
  final List<Education> education;
  final List<TechnicalSkill> technicalSkills;
  final List<Project> projects;
  final List<String> clubs;

  // Constructor
  UserInfo(
      {required this.name,
      required this.course,
      required this.instituteName,
      required this.profilePic,
      required this.contactInformation,
      required this.education,
      required this.technicalSkills,
      required this.projects,
      required this.clubs});
}

// Defining the ContactInformation class
class ContactInformation {
  final String phoneNumber;
  final String email;
  final String address;

  // Constructor
  ContactInformation(this.phoneNumber, this.email, this.address);
}

// Defining the Education class
class Education {
  final String degree;
  final String university;
  final String year;
  final double gpa;

  // Constructor
  Education(this.degree, this.university, this.year, this.gpa);
}

// Defining the TechnicalSkill class
class TechnicalSkill {
  final String name;
  final String imagePath;

  // Constructor
  TechnicalSkill(this.name, this.imagePath);
}

// Defining the Project class
class Project {
  final String name;
  final String technologiesUsed;
  final String description;

  // Constructor
  Project(this.name, this.technologiesUsed, this.description);
}
