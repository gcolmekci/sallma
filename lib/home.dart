import 'package:flutter/material.dart';
import 'package:untitled/categories.dart';
import 'package:untitled/components/bottomNavigation.dart';
import 'package:untitled/components/label.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //Başlık
                  buildBaslik(),

                  //Banner
                  buildBanner(),
                  // Butonlar

                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //ilk eleman
                        buildNavigation(
                            text: "Kategoriler",
                            icon: Icons.menu,
                            widget: categoriesPage(),
                            context: context),
                        buildNavigation(
                            text: "Favorilet",
                            icon: Icons.star_border,
                            widget: categoriesPage(),
                            context: context),
                        buildNavigation(
                            text: "Hediyelikler",
                            icon: Icons.card_giftcard,
                            widget: categoriesPage(),
                            context: context),
                        buildNavigation(
                            text: "En Çok Satılanlar",
                            icon: Icons.people,
                            widget: categoriesPage(),
                            context: context),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  //indirim ürünleri BAŞLIK
                  Text(
                    "İndirimdekiler",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFF0A1034)),
                  ),
                  SizedBox(height: 16),

                  //indirimdeki ÜRÜNLER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Akıllı Telefonlar",
                        photoUrl: "assets/images/akillitelefonlar.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Tabletler",
                        photoUrl: "assets/images/tabletler.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Akıllı Telefonlar",
                        photoUrl: "assets/images/akillitelefonlar.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Tabletler",
                        photoUrl: "assets/images/tabletler.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Akıllı Telefonlar",
                        photoUrl: "assets/images/akillitelefonlar.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Tabletler",
                        photoUrl: "assets/images/tabletler.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "MacBook",
                        photoUrl: "assets/images/akillitelefonlar.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Laptoplar",
                        photoUrl: "assets/images/tabletler.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //her sayfa alt satır sepet vb.
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return const Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Text(
      "Anasayfa",
      style: TextStyle(
        fontSize: 32,
        color: Color(0xFF0A1034),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 36, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
            color: const Color(0xFF0001FC),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Apple M1 Çip",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Fiyat:24590 TL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Image.asset("assets/images/speaker.png"),
          ],
        ),
      ));
}

Widget buildNavigation({
  String text = "",
  required IconData icon,
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        ),
      );
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
              color: Color(0xDD1D53E4),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildSalesItem({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenWidth,
}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //yüzde 50 indirim ürünleri
        label(discount),
        SizedBox(height: 22),
        //indirimdeki ürün resimleri
        Center(child: Image.asset(photoUrl)),
        SizedBox(height: 22),
        //indirimdeki 1.ürün

        Center(
          child: Text(text,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034))),
        ),
      ],
    ),
  );
}
