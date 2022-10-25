import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/verify.dart';



class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);
  static String verify ="";

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var phone="";
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
                    Icons.close,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Please Enter your mobile number',
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
                'You\'ll receive a 4 digit code to verify next.',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color.fromARGB(255, 106, 108, 123), fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 349.0,
              child: TextField(
                //keyboardType:TextInputType.phone,
                onChanged: (value){
                  phone=value;
                },
                decoration: new InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/india.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                  prefixText: '+91 -',
                  hintText: "Mobile Number",
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
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
                onPressed: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91$phone',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
 // MyPhone.verify=verificationId;
   Otp.verify=verificationId;
    Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const Verify()),);

  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Verify()),
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
