import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KayitOlDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Oturum Aç",),
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
      body:
       Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "resimler/_icon.png",
                        width: 100,
                        height: 150,

                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        kullaniciGirisleri(label: "Kullanıcı Adı"),
                        kullaniciGirisleri(label: "E-posta"),
                        kullaniciGirisleri(label: "Şifre", obscureText: true),
                        kullaniciGirisleri(label: "Şifre Tekrar",obscureText: true),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(

                        minWidth: double.infinity,
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        color: Colors.orange,
                        height: 50,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ],

      ),
    );
  }
}

Widget kullaniciGirisleri({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
            ),
            border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      )
    ],
  );
}
