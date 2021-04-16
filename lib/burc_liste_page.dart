import 'package:flutter/material.dart';
import 'models/burc_page.dart';
import 'utils/strings.dart';

//import 'package:burc_rehberi/index.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynagi();
    return Scaffold(
      appBar: AppBar(title: Text("Burc Rehberi")),
      body: listeyiHazirla(),
    );
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  // ignore: missing_return
  List<Burc> veriKaynagi() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; // Koc->koc1.png
      String buyukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}.png"; // Koc-> koc_buyuk1.png

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  // ignore: missing_return
  Widget tekBurc(BuildContext context, int index) {
    Burc eklenenBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + eklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(eklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        subtitle: Text(eklenenBurc.burcTarihi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.amber)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
