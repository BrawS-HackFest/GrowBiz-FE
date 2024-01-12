import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_video.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class DetailMyCourse extends StatefulWidget {
  const DetailMyCourse({super.key});

  @override
  State<DetailMyCourse> createState() => _DetailMyCourseState();
}

class _DetailMyCourseState extends State<DetailMyCourse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Topik', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardVideo(pathUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",),
                const SizedBox(height: 9,),
                Text('Simulasi kedai kopi kekinian', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.access_time_outlined, color: MyColors.primaryBase,),
                          Text('15 menit', style: MyTextStyle.captionH5(color: MyColors.greyBase),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.menu_book_outlined, color: MyColors.primaryBase,),
                          Text('4/12 Bab', style: MyTextStyle.captionH5(color: MyColors.greyBase),)
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                Container(
                  width: 300,
                  height: 175,
                  child: PDFView(
                    filePath: 'http://www.pdf995.com/samples/pdf.pdf',
                  ),
                ),
                const SizedBox(height: 25,),
                Text('Deskripsi', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                const SizedBox(height: 3,),
                Text('Dalam menjalankan bisnis seseorang pasti harus merencanakan anggaran untukbisnisnya. Tanpa rencana anggaran yang detail dan jelas, bisnis tentu tidak akan bisamaju dan berkembang seperti yang diharapkan. Untuk itu, bagi mereka yang inginterjun ke dunia bisnis, sebaiknya perlu memahami mengenai perencanaan anggaran.Rencana anggaran biaya merupakan perkiraan biaya yang nantinya akan digunakanuntuk pembagunan bisnis kedai kopi. ',
                  style: MyTextStyle.captionH5(color: MyColors.greyBase),
                  textAlign: TextAlign.justify,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
