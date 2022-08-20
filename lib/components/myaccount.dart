import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fosterateapp/components/usermodel.dart';

class myaccount extends StatefulWidget {
  const myaccount({Key? key}) : super(key: key);

  @override
  State<myaccount> createState() => _myaccountState();
}

class _myaccountState extends State<myaccount> {
  UserModel userData = UserModel(
      employeeId: "em",
      Name: "em2",
      PhoneNumber: "em2",
      MailId: "em2",
      Gender: "em2",
      ImageUrl: "em2",
      Role: "em2",
      WorkStatus: "em2",
      Dob: "er");
  var color = Colors.red;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;

    print("this is data object: ${data['userObj']}");

    print(data["userObj"].employeeId);
    setState(() {
      if (data["userObj"] != null) userData = data["userObj"] as UserModel;
      if (userData.WorkStatus == "Cancelled") {
        color = Colors.red;
      } else if (userData.WorkStatus == "Started") {
        color = Colors.blue;
      }
      else{
        color = Colors.green;
      }
    });

    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          centerTitle: true,
          title: Text("My Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image(
                        image: AssetImage(
                          'face1.jpg',
                        ),
                        width: 80,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${userData.Name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("${userData.MailId}"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("${userData.PhoneNumber}")
                  ],
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Employee ID:"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Date Of Birth:"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Gender : "),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Roles:"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${userData.PhoneNumber}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${userData.Dob}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${userData.Gender}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${userData.Role}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Status",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  child: Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("WorkStatus"),
                    Text(
                      "${userData.WorkStatus}",
                      style: TextStyle(
                          color: color, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sign Out")
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.orange[900],
          children: [
            SpeedDialChild(
              child: Icon(Icons.delete),
              onTap: () => print("Delete Tapped"),
              label: "Delete",
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
            SpeedDialChild(
              child: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
                print("Edit tapped");
              },
              label: "Edit",
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            )
          ],
        ),
      )
    );
  }
}
