import 'dart:async';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  // code part
  late EmailAuth emailAuth = EmailAuth(sessionName: 'Odev4');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();


  // this function will help us to send otp as an email
  void sendOTP() async{
    bool res = await emailAuth.sendOtp(recipientMail: _emailController.text);  // The sendOtp method take the email as parameter from the TextField, Its return either true of false
    if (res)
      print('otp gonderildi');
    else
      print('Hata oldu');
  }

  // this function will help us to verify the otp
  void verifyOTP(){
    var res = emailAuth.validateOtp(recipientMail: _emailController.text, userOtp: _otpController.text);
    if (res) {
      print('Basarili');
    }
    else
      print('Basarisiz');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ödev4 - 180541603',style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Image.asset('Assets/images/firat_uni_logo_en.png',fit: BoxFit.cover,),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [

                // 1'st child
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.indigo,size: 30,),
                    labelText: "Email adresinizi giriniz :",
                    labelStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),

                SizedBox(height: 15,),

                // 2'nd child
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,color: Colors.indigo,size: 30,),
                    labelText: "Tek kullanımlık şifrenizi giriniz :",
                    labelStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),

                SizedBox(height: 30,),

                // 3'rd child
                ElevatedButton(
                  //style: Color(Colors.indigo),
                  child: Text('OTP Gönder',style: TextStyle(fontSize: 25)),
                  onPressed: () {
                    setState(() {
                      sendOTP();
                    });
                  },
                ),

                SizedBox(height: 15,),


                // 4'th child
                ElevatedButton(
                  child: Text('OTP doğrula',style: TextStyle(fontSize: 25),),
                  onPressed: () => verifyOTP(),
                ),
                SizedBox(height: 25,),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
