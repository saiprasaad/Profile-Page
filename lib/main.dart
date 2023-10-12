import 'package:cs442_mp1/models/userinfo.dart';
import 'package:cs442_mp1/views/profile.dart';
import 'package:flutter/material.dart';

// main function
void main() {
  // Populating the contact information
  ContactInformation contactInformation = ContactInformation("+1 773 800 5483",
      "skalyanaraman@hawk.iit.edu", "2951 South King Drive, Chicago, IL 60616");

  // Populating the education list
  List<Education> educations = [
    Education("Masters", "Illinois Institute of Technology", "May 2024", 3.5),
    Education("Bachelors", "Anna University", "April 2021", 3.8)
  ];

  // Populating the technical skills list
  List<TechnicalSkill> technicalSkills = [
    TechnicalSkill("Java", "assets/images/java.png"),
    TechnicalSkill("Python", "assets/images/python.png"),
    TechnicalSkill("Angular", "assets/images/angular.png"),
    TechnicalSkill("Spring Boot", "assets/images/spring boot.png"),
    TechnicalSkill("Node JS", "assets/images/nodejs.png"),
    TechnicalSkill("PostgreSQL", "assets/images/postgresql.png"),
    TechnicalSkill("MySQL", "assets/images/mysql.png"),
    TechnicalSkill("Swift", "assets/images/swift.png"),
  ];

  // Populating the projects list
  List<Project> projects = [
    Project(
        "USA Social Hub",
        "Angular, Node.js/Express, PostgreSQL, ElasticSearch",
        "A web application where the users search for restaurants by entering area name, street name or zip code"),
    Project("FoodSwipe", "Spring Boot, React, Kafka, Docker, MySQL",
        " A real-time micro service application that allows the users to order desired items from the desired restaurants"),
    Project("StudentVoice", "HTML 5, CSS 3, Bootstrap, Ajax, PHP, MySQL",
        " A web application for the students to provide feedback on their enrolled courses in the form of ratings and reviews")
  ];

  // Populating the clubs list
  List<String> clubs = [
    "Senior TechNews Writer",
    "Association for Computing Machinery",
    "Library Student Advisory Group"
  ];

  // Populating the userInfo object
  UserInfo userInfo = UserInfo(
      name: "Saiprasaad Kalyanaraman",
      course: "Masters of Computer Science",
      instituteName: "Illinois Institute of Technology",
      profilePic: "assets/images/Profile_pic.jpg",
      contactInformation: contactInformation,
      education: educations,
      technicalSkills: technicalSkills,
      projects: projects,
      clubs: clubs);

  // Passing the userInfo page
  runApp(ProfilePage(userInfo: userInfo));
}
