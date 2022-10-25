import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/otp.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => VerifyState();
}

class VerifyState extends State<Verify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String code;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        //width: 1200,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/otpbg.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
            ),
            SizedBox(
              width: 400,
              height: 30,
              child: IconButton(
                icon: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Otp()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Verify Phone',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 182,
              child: Text(
                maxLines: 10,
                'Code is sent to +91 -XXXXXXXXXX ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color.fromARGB(255, 106, 108, 123), fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(width: 130),
            OtpTextField(
            filled: true,
            fillColor: Color(0xff93D2F3),
            fieldWidth: 55,
            numberOfFields: 6,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderWidth: 0,
            showFieldAsBox: true,
            onSubmit: (String verificationCode) {
              print(verificationCode);
              code = verificationCode;
              print(code);
            },
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t receive the code?"),
                TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {},
                    child: Text("Request Again"))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 349.0,
              height: 48.0,
              child: ElevatedButton(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                    child: Text(
                      "VERIFY & CONTINUE",
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
                onPressed: () async {
                  print(code);
                  var smsCode = code.trim();
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: Otp.verify, smsCode: smsCode);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "profile", (route) => false);
                  } catch (e) {
                    print("wrong otp");
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Profile()),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
