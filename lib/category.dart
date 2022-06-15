import 'package:flutter/material.dart';
import 'package:untitled/components/bottomNavigation.dart';
import 'package:untitled/components/header.dart';
import 'package:untitled/productDetail.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);
  //const CategoryPage({Key? key}) : super(key: key);
  List<Map> products = [
    {"isim": "MSi", "fotograf": "assets/images/bil1.png", "fiyat": "33.552 TL"},
    {
      "isim": "MSi1",
      "fotograf": "assets/images/bil2.png",
      "fiyat": "27.099 TL"
    },
    {"isim": "MSi2", "fotograf": "assets/images/bil3.png", "fiyat": "3.500 TL"},
    {
      "isim": "MSi3",
      "fotograf": "assets/images/bil3.png",
      "fiyat": "28.750 TL"
    },
    {
      "isim": "MSi4",
      "fotograf": "assets/images/bil3.png",
      "fiyat": "47.870 TL"
    },
    {
      "isim": "MSi5",
      "fotograf": "assets/images/bil3.png",
      "fiyat": "11.300 TL"
    },
    {
      "isim": "MSi5",
      "fotograf": "assets/images/bil3.png",
      "fiyat": "12.850 TL"
    },
    {
      "isim": "MSi5",
      "fotograf": "assets/images/bil3.png",
      "fiyat": "14.999 TL"
    },
    {"isim": "MSi5", "fotograf": "assets/images/bil3.png", "fiyat": "9.999 TL"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //başlık
          header(categoryTitle, context),
          SizedBox(height: 32),

          //içerikler

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: products.map((Map product) {
                return buildContent(product["isim"], product["fotograf"],
                    product["fiyat"], context);
              }).toList(),
            ),
          ),
        ]),
      ),
      // alt satır her sayfa için sepet vb
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(photoUrl),
          //SizedBox(height: 32), taşma yaptığı için kaldırdım
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF0A1034),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$price",
                style: TextStyle(
                  color: Color(0xFF0001FC),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
