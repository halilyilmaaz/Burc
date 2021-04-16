import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste_page.dart';
import 'models/burc_page.dart';
//import 'package:burc_rehberi/index.dart';

class BurcDetay extends StatelessWidget {
  int gelenindex;
  Burc secilenBurc;
  BurcDetay(this.gelenindex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenindex];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            title: Text(secilenBurc.burcAdi + "Burcu ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(secilenBurc.burcDetayi,
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
