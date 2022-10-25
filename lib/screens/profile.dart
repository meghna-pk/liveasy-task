import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

// void main() {
//   runApp(const MyApp());
// }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 180,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Please select your profile',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: DecorationImage(
                    image: AssetImage("assets/house.png"),
                    alignment: Alignment(-.5, 0),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        IconButton(
                          color: Colors.blue,
                          disabledColor: Colors.blue,
                          alignment: Alignment.topLeft,
                          icon:
                              Icon(Icons.circle_outlined, color: Colors.black),
                          onPressed: () {},
                        ),
                      ]),
                      SizedBox(
                        width: 80,
                        height: 40,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 100,
                                    child: Text(
                                      'Shipper',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 120),
                            Row(
                              children: [
                                SizedBox(
                                  width: 209,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet,consectetur adipiscing',
                                    maxLines: 10,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ])),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: DecorationImage(
                    image: AssetImage("assets/vehicle.png"),
                    alignment: Alignment(-.5, 0),
                  ),
                ),
                child: Row(children: [
                  Column(children: [
                    IconButton(
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.circle_outlined, color: Colors.black),
                      onPressed: () {},
                    ),
                  ]),
                  SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 120,
                                child: Text(
                                  'Transporter',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 120),
                        Row(
                          children: [
                            SizedBox(
                              width: 199,
                              child: Text(
                                'Lorem ipsum dolor sit amet,consectetur adipiscing',
                                maxLines: 10,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ])),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: SizedBox(
                width: 216.0,
                height: 48.0,
                child: ElevatedButton(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 22, 45, 85)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
