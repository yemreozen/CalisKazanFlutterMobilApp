import 'package:calistakazan/kategoriler.dart';
import 'package:calistakazan/screens/menuMagazaDetail.dart';
import 'package:calistakazan/urunler.dart';
import 'package:calistakazan/urunlerdao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuMagazaUrunleri extends StatefulWidget {
  Kategoriler kategori;
  MenuMagazaUrunleri({required this.kategori});

  @override
  State<MenuMagazaUrunleri> createState() => _MagazaUrunlerRow();
}

class _MagazaUrunlerRow extends State<MenuMagazaUrunleri> {

  Future<List<Urunler>> KategoriyeGoreUrunGet(int kategori_id) async {
    var urunlist = await Urunlerdao().tumUrunler(kategori_id);
    return urunlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 45.0,
          color: Colors.white,
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "${widget.kategori.kategori_ad}",
          style: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Urunler>>(
        future: KategoriyeGoreUrunGet(widget.kategori.kategori_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var urunlerlist = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: urunlerlist!.length,
              itemBuilder: (context, indeks) {
                var urunler = urunlerlist[indeks];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuMagazaDetail(urunler: urunler)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("resimler/${urunler.urun_resmi}"),
                          height: 250.0,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2.2,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [

                              Text(
                                urunler.urun_ad,
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                    fontSize: 15.0,
                                    color: Colors.orange,
                                    fontFamily: "Oswald"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  Text("${urunler.urun_price}bin para puan",
                                      style: TextStyle(fontFamily: "Oswald",fontSize: 15.0)),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Card();
          }
        },
      ),
    );
  }
}

