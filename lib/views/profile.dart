import 'package:cs442_mp1/models/userinfo.dart';
import 'package:flutter/material.dart';

// Defining the ProfilePage class
class ProfilePage extends StatelessWidget {
  // Declaring the userInfo object and initializing it in the constructor
  final UserInfo userInfo;
  const ProfilePage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defining Scaffold as parent element
      home: Scaffold(
        // Defining AppBar
        appBar: AppBar(
            title: const Center(
                child: Text("My Portfolio", textAlign: TextAlign.center))),
        // Defining ListView for the entire body with each of the sections as children
        body: ListView(children: [
          ProfileIntroWidget(
              name: userInfo.name,
              course: userInfo.course,
              instituteName: userInfo.instituteName,
              profilePic: userInfo.profilePic),
          const Divider(color: Colors.black, thickness: 1),
          const SizedBox(height: 10),
          ContactInformationWidget(
              contactInformation: userInfo.contactInformation),
          const SizedBox(height: 20),
          EducationWidget(education: userInfo.education),
          const SizedBox(height: 20),
          TechnicalSkillsWidget(technicalSkills: userInfo.technicalSkills),
          const SizedBox(height: 20),
          ProjectsWidget(projects: userInfo.projects),
          const SizedBox(height: 20),
          ClubsWidget(clubs: userInfo.clubs)
        ]),
      ),
    );
  }
}

// The widget which displays the profile pic, name, course name and institution name
class ProfileIntroWidget extends StatelessWidget {
  const ProfileIntroWidget(
      {super.key,
      required this.name,
      required this.course,
      required this.instituteName,
      required this.profilePic});

  final String name;
  final String course;
  final String instituteName;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(70.0),
                child: Image.asset(
                  profilePic,
                  width: 140,
                  height: 140,
                  fit: BoxFit.fill,
                )),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 40),
              Text(name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true),
              const SizedBox(height: 5),
              Text(course,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 5),
              Text(instituteName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ])
          ],
        ));
  }
}

// The widget which displays the contact information as Table
class ContactInformationWidget extends StatelessWidget {
  const ContactInformationWidget({
    super.key,
    required this.contactInformation,
  });

  final ContactInformation contactInformation;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text("Contact Information",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ))),
      Container(
          margin: const EdgeInsets.only(right: 80, left: 80),
          child: Table(columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(6)
          }, children: [
            TableRow(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Icon(Icons.call, size: 20)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(contactInformation.phoneNumber,
                      style: const TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.left))
            ]),
            TableRow(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Icon(Icons.mail, size: 20)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(contactInformation.email,
                      style: const TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.left))
            ]),
            TableRow(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Icon(Icons.location_city, size: 20)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(contactInformation.address,
                      style: const TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.left))
            ])
          ]))
    ]);
  }
}

// The widget which displays the technical skills as horizontal ListView
class TechnicalSkillsWidget extends StatelessWidget {
  const TechnicalSkillsWidget({
    super.key,
    required this.technicalSkills,
  });

  final List<TechnicalSkill> technicalSkills;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Technical Skills",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
      SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (TechnicalSkill technicalSkill in technicalSkills)
              SizedBox(
                width: 160,
                child: Column(
                  children: [
                    Image.asset(technicalSkill.imagePath,
                        width: 140, height: 100),
                    Text(technicalSkill.name)
                  ],
                ),
              ),
          ],
        ),
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.arrow_left_sharp),
        Icon(Icons.arrow_right_sharp)
      ])
    ]);
  }
}

// The widget which displays the projects as BoxDecoration
class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({
    super.key,
    required this.projects,
  });

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Projects",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
      Container(
          margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              for (Project project in projects)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              project.technologiesUsed,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              project.description,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ])),
                ),
            ],
          ))
    ]);
  }
}

// The widget which displays the education as DataTable
class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
    required this.education,
  });

  final List<Education> education;

  @override
  Widget build(BuildContext context) {
    List<DataRow> educationList = [];
    for (Education education in education) {
      educationList.add(DataRow(cells: [
        DataCell(Text(education.degree)),
        DataCell(Text(education.university)),
        DataCell(Text(education.year)),
        DataCell(Text(education.gpa.toString())),
      ]));
    }
    return Column(
      children: [
        const Text("Education",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            )),
        DataTable(columns: const [
          DataColumn(
            label: Text('Degree'),
          ),
          DataColumn(
            label: Text('University'),
          ),
          DataColumn(
            label: Text('Year'),
          ),
          DataColumn(
            label: Text('CGPA'),
          ),
        ], rows: educationList)
      ],
    );
  }
}

// The widget which displays the clubs as BoxDecoration
class ClubsWidget extends StatelessWidget {
  const ClubsWidget({
    super.key,
    required this.clubs,
  });

  final List<String> clubs;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Clubs",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
      Container(
          margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: [
              for (String club in clubs)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    club,
                    textAlign: TextAlign.center,
                  )),
                ),
            ],
          ))
    ]);
  }
}
