import 'package:calistakazan/VeriTabaniYardimcisi.dart';
import 'package:calistakazan/kategoriler.dart';
import 'package:calistakazan/urunler.dart';

class Urunlerdao {
  Future<List<Urunler>> tumUrunler(int kategori_id) async {
    var db = await VeritabaniYrd.vtErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kategori,urunler WHERE urunler.urun_kat_id=kategori.kategori_id AND urunler.urun_kat_id=$kategori_id");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"],satir["kategori_resim"]);
      var u = Urunler(satir["urun_id"], satir["urun_ad"],satir["urun_price"],k,
          satir["urun_resmi"],satir["urun_desc"]);
      return u;
    });
  }
}
