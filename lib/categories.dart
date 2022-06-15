import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:untitled/category.dart';
import 'package:untitled/components/bottomNavigation.dart';
import 'package:untitled/components/header.dart';

class categoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Tüm Ürünler",
    "Bilgisayarlar",
    "Aksesuarlar",
    "Akıllı Telefonlar",
    "Akıllı Telefon Aksesuarları",
    "Diğer Ürünler",
  ];
  //const categoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            header("Categories", context),

            SizedBox(height: 16),

            Expanded(
              child: ListView(
                  children: categories
                      .map((String title) => buildCategory(title, context))
                      .toList()),
            ),
          ],
        ),
      ),
      //en alt satır sepet vb.
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034)),
      ),
    ),
  );
}
