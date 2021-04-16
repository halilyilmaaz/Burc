import 'package:flutter/material.dart';
import 'burc_detay_page.dart';
import 'burc_liste_page.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/burcListesi",
      routes: {
        //"/burcListesi": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == 'burcDetay') {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: BurcListesi(),
    );
  }
}
