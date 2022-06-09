import 'package:calistakazan/urunler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuMagazaDetail extends StatefulWidget {
  Urunler urunler;
  MenuMagazaDetail({required this.urunler});
  @override
  State<StatefulWidget> createState() => _MenuMagazaDetail();
}

class _MenuMagazaDetail extends State<MenuMagazaDetail>
    with TickerProviderStateMixin {
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
          "Ürün Detay",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildUrunlerDetail(context),
      bottomNavigationBar: _buildShopBar(),
    );
  }

  _buildUrunlerDetail(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _urunImages(),
              SizedBox(
                height: 12.0,
              ),
              _urunTitle(),
              SizedBox(
                height: 12.0,
              ),
              _urunPrice(),
              SizedBox(
                height: 12.0,
              ),
              _bolumEkle(size),
              SizedBox(
                height: 12.0,
              ),
              _tanitim(),
              SizedBox(
                height: 12.0,
              ),
            ],
          ))
    ]);
  }

  _urunImages() {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: Image.asset("resimler/${widget.urunler.urun_resmi}"),
        ),
      ),
    );
  }

  _urunTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: Text(
          widget.urunler.urun_ad,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontFamily: "Righteous"),
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
          height: 0.50,
        )
      ],
    );
  }

  _tanitim() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          TabBar(controller: tabController, tabs: [
            Tab(
              child: Text(
                "Ürün Hakkında",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Righteous"),
              ),
            ),
            Tab(
              child: Text(
                "Bilgilendirme",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Righteous"),
              ),
            )
          ]),
          Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: TabBarView(
              controller: tabController,
              children: [
                Text(
                  widget.urunler.urun_desc,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Lütfen satın almadan önce tüm sözleşme koşullarımızı okuyunuz. Sözleşmeye uymadığınız takdirde hesabınızdaki bakiyeler sıfırlanır, hak sonucu alacak olacağınız bu ürünü alamazsınız. ",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _urunPrice() {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            "${widget.urunler.urun_price}bin para puan",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
    );
  }

  _buildShopBar() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      Text(
                        "Sepete Ekle",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
