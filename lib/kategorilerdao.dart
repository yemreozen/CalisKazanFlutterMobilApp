import 'package:calistakazan/kategoriler.dart';

import 'VeriTabaniYardimcisi.dart';

class Kategorilerdao
{
  Future <List<Kategoriler>> tumKategoriler()async
  {
    var db=await VeritabaniYrd.vtErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategori");
    return List.generate(maps.length,(i)
    {
      var satir=maps[i];
      return Kategoriler(satir["kategori_id"],satir["kategori_ad"],satir["kategori_resim"] );
    });
    
  }
}