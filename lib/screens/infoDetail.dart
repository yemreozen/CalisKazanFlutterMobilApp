import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoDetail();
}

class _InfoDetail extends State<InfoDetail> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          iconSize: 45.0,
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.orange,
        title: Text(
          "Hakkımızda",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildAirpodsDetail(context),
    );
  }

  _buildAirpodsDetail(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _airpodsImages(),
              SizedBox(
                height: 12.0,
              ),
              _bolumEkle(size),
              SizedBox(
                height: 12.0,
              ),
              _aciklama(),
            ],
          ))
    ]);
  }

  _airpodsImages() {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: Image.asset("resimler/infopage.png"),
        ),
      ),
    );
  }

  _bolumEkle(Size screnSize) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: screnSize.width,
          height: 3.0,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  _aciklama() {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(5.00),
            child: Text(
                "\r \r \r Çalıştıkça kazan mobil programı şimdilerin popüler çalışma sistemi olan Pomodoro yöntemine istinaden geliştirilmekte olan bir programdır. Öğrenciler, yazılımcılar, belli periyotlarla odaklanılması gereken aynı zamanda molalar vererek çalışmayı keyifli ve verimli hale getiren bir programdır. Bu programla birlikte kullanıcılar hem çalışacak hem de çalışmaları sırasında biriken para puanlarla birlikte mağazadan gerçek ödüllere sahip olabilecekler.",style: TextStyle(fontSize: 20,fontFamily: "GROBOLD.tff"),),
          ),
        ),
        Card(
          child: Column(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.all(5.00),
                child: Text(
                    "\r \r \r Eğer kullanıcılar login olmazlarsa şayet geçirdikleri süre kadar para puan kazanacakları için para puanlarını kaybedeceklerdir. Bu yüzden mutlaka para puan kazanmak için login olmaları gerekmektedir."),
              ),
            ],
          ),
        ),


      ],
    );
  }
}
