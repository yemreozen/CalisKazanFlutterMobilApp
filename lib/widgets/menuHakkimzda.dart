import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../untiteils/constants.dart';

class HakkimizdaRow extends StatelessWidget {
  late String name;


  HakkimizdaRow({required this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuListCardInfo(context),
      ],
    );
  }

  _buildMenuListCardInfo(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.INFO_DETAIL);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            children: [
              Container(
                child: Image.asset("resimler/info.png"),
                padding: EdgeInsets.only(left: 10.0),
                margin: EdgeInsets.all(10.0),
                height: 170.0,
                width: MediaQuery.of(context).size.width / 1.1,
              ),
              SizedBox(
                height: 6.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.0),
                child: Column(
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: "Righteous"),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
