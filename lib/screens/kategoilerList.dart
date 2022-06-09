import 'package:calistakazan/kategoriler.dart';
import 'package:calistakazan/kategorilerdao.dart';
import 'package:calistakazan/screens/menuListMagaza.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KategoriSayfa extends StatefulWidget {
  @override
  State<KategoriSayfa> createState() => _KategoriSayfaState();
}

class _KategoriSayfaState extends State<KategoriSayfa> {
  Future<List<Kategoriler>> tumKategorileriGetir() async {
    var kategoriList = await Kategorilerdao().tumKategoriler();
    return kategoriList;
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

        title: Text("KATEGORİLER",style: TextStyle(color: Colors.white),),
        centerTitle: true,


      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: tumKategorileriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kategoriList = snapshot.data;
            return ListView.builder(
              itemCount: kategoriList!.length,
              itemBuilder: (context, indeks) {
                var kategori = kategoriList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MenuMagazaUrunleri(kategori:kategori)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: SizedBox(
                        height: 310,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "resimler/${kategori.kategori_resim}",
                                      height: 200,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Text(
                                    kategori.kategori_ad,
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.orange,
                                        fontFamily: "Oswald"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
