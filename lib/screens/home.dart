import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/otp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("English"), value: "English"),
    DropdownMenuItem(child: Text("Hindi"), value: "Hindi"),
  ];
  String selectedValue = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 180,
            ),
            Image.asset('assets/image.png'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Please select your language',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 192,
              height: 29,
              child: Text(
                maxLines: 10,
                'You can change the language at any time',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color.fromARGB(255, 106, 108, 123), fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    value: selectedValue,
                    items: menuItems),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 216.0,
              height: 48.0,
              child: ElevatedButton(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    child: Text(
                      "NEXT",
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Otp()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
