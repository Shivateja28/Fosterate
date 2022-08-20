import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:fosterateapp/components/usermodel.dart';
import 'card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Image(
              image: NetworkImage("https://fosterate.com/assets/favicon.ico"),
              width: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Fosterate",
              style: TextStyle(color: Colors.black),
            ),
          ]),
          Row(children: [
            Icon(
              Icons.notification_add,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                image: AssetImage(
                  'face1.jpg',
                ),
                width: 50,
              ),
            )
          ]),
        ]),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/db.json"),
          builder: (context, snapshot) {
            var li = [];
            var mydata = jsonDecode(snapshot.data.toString());
            for (int i = 0; i < mydata.length; i++) {
              AlertDialog();
              print("${mydata[i]["Dob"]}");
              UserModel x = UserModel(
                  employeeId: mydata[i]["employeeId"],
                  Name: mydata[i]["Name"],
                  PhoneNumber: mydata[i]["PhoneNumber"],
                  MailId: mydata[i]["MailId"],
                  Gender: mydata[i]["Gender"],
                  ImageUrl: mydata[i]["ImageUrl"],
                  Role: mydata[i]["Role"],
                  WorkStatus: mydata[i]["WorkStatus"],
                  Dob: (mydata[i]["Dob"]!=null)?mydata[i]["Dob"]:"2844/44");
              li.add(x);
            }

            print(li);
            return Column(
                children: li
                    .map((value) => Column(
                          children: [
                            Carddata(user: value),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ))
                    .toList());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Tapped");
            Navigator.pushNamed(context, '/myaccount');
          },
          child: Text("Myaccount")),
    );
  }
}
