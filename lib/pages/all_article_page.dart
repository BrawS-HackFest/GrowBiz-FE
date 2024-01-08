import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_article.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';

class AllArticlePage extends StatelessWidget {
  AllArticlePage({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Kursus', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(24),
        child: Column(
          children: [
            MyTextField(hint: 'Cari Sesuatu', controller: searchController, icon: Icons.search),
            const SizedBox(height: 15,),
            Expanded(
                child: ListView.separated(itemBuilder: (context, index) {
                  return CardArticle();
                }, separatorBuilder: (context, index) {
                  return const SizedBox(height: 15,);
                }, itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
