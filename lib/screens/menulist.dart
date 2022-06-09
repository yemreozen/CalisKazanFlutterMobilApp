import 'package:calistakazan/screens/oturumAc.dart';

import 'package:calistakazan/widgets/menuHakkimzda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/menuListRow.dart';
import '../widgets/menuMagazaRow.dart';

class MenuList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.00,
        title: Text(
          "Menü",
          style: TextStyle(color: Colors.black, fontFamily: 'Oswald'),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              children: [
                Text(
                  "Oturum Aç",
                  style: TextStyle(fontSize: 15.0,fontFamily: "Righteous-Regular"),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                 OturumAc(),
                      ));
                    },
                    icon:Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                      color: Colors.white,

                    ))
              ],
            ),
          ),
        ],
      ),
      body: _buildMenuPages(),
    );
  }

  _buildMenuPages() {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildMenuListRow();
            } else if (index == 1) {
              return _buildMenuMagaza();
            } else if (index == 2) {
              return _buildHakkimizda();
            } else {
              return SizedBox(
                height: 20.0,
              );
            }
          }),
    );
  }

  _buildMenuListRow() {
    return MenuListRow(
      name: "Çalışamaya Başla",
    );
  }

  _buildMenuMagaza() {
    return MenuMagazaRow(
      name: "Mağaza",
      imageUrl: "",
    );
  }

  _buildHakkimizda() {
    return HakkimizdaRow(
      name: "Hakkımızda",
    );
  }
}
