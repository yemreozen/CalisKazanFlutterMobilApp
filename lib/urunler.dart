import 'package:calistakazan/kategoriler.dart';

class Urunler
{
  late int urun_id;
  late String urun_ad;
  late String urun_resmi;
  late int urun_price;
  late String urun_desc;
  late Kategoriler kategori;



  Urunler(this.urun_id,this.urun_ad,this.urun_price,this.kategori,this.urun_resmi,this.urun_desc);

}