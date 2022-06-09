import 'package:calistakazan/screens/infoDetail.dart';
import 'package:calistakazan/screens/kategoilerList.dart';
import 'package:calistakazan/screens/kayitOl.dart';
import 'package:calistakazan/screens/menulistdetails.dart';

import 'package:calistakazan/untiteils/constants.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.MENU_DETAIL: (BuildContext context) => MenuDetails(),
    Constants.INFO_DETAIL: (BuildContext context) => InfoDetail(),
    Constants.KAYITOL_DETAIL: (BuildContext context) => KayitOlDetail(),
    Constants.KATEGORILER: (BuildContext context) => KategoriSayfa(),
  };
}
