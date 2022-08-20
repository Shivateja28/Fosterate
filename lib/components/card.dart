import 'package:flutter/material.dart';
import 'package:fosterateapp/components/usermodel.dart';

class Carddata extends StatelessWidget {
  var user;
  Carddata({this.user});

  @override
Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                height: 15,
              ),
              Text(
                "${user.Name}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call),
                      SizedBox(
                        height: 10,
                      ),
                      Text("${user.PhoneNumber}")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        height: 10,
                      ),
                      Text("${user.MailId}")
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print("Tap");
        Navigator.pushNamed(context, '/myaccount', arguments: {
          "userObj": user,
        });
      },
    );
  }
}
