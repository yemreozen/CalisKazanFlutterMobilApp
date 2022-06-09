import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class VeritabaniYrd
{
  static final String VeritabaniAdi="Urunler.sqlite";

  static Future<Database> vtErisim() async
  {
    String VeritabaniYolu=join(await getDatabasesPath(),VeritabaniAdi);

    if(await databaseExists(VeritabaniYolu))
    {
      print("Database kayıtlı, kopyalamaya gerek yok");
    }
    else {
      ByteData data=await rootBundle.load(("database/$VeritabaniAdi"));
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File (VeritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabani Kopyalandi");
    }

    return openDatabase(VeritabaniYolu);
  }

}

