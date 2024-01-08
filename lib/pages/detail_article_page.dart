import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';
class DetailArticle extends StatelessWidget {
  const DetailArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel', style: MyTextStyle.judulH5(color: MyColors.blackBase)),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Memajukan UMKM Lokal: Pendampingan dalam  menginovasi Memperluas Produk', style:TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 202,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.asset('assets/images/umkm1.png', fit: BoxFit.cover,),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, color: MyColors.grey200,size: 15,),
                          const SizedBox(width: 5,),
                          Text('4.050', style: MyTextStyle.captionH5(color: MyColors.grey200),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: MyColors.grey200,size:15,),
                          const SizedBox(width: 5,),
                          Text('14 Jan 2023', style: MyTextStyle.captionH5(color: MyColors.grey200),)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Text('Pemilik UMKM Keripik Tahu Barokah  bernama Bapak Mustofa. Usaha ini di jalankan oleh keluarga sendiri tanpa ada bantuan/pekerja lain, di kerjakan sendiri oleh bapak, ibu dan anak. Sebelum usaha keripik tahu ini di jalankan, keluarga Bapak Mustofa hanya menjual atau membuat tahu pong yaitu tahu putih yang di goreng saja tanpa di olah lagi. Tahu pong ini biasa di gunakan oleh kosumen atau pelanggan untuk membuat tahu bakso, tahu isi dan lain-lain. Setelah adanya usaha tahu pong,pada tahun  2019 Bapak Mustofa dan keluarga mempunyai ide untuk membuka usaha lain yaitu dengan membuat produk Keripik Tahu. Bedasarkan wawancara dengan bapak Mustofa selaku pemilik UMKM Tahu Barokah beliau merasa kesulitan dalam memasarkan dan memperluas pasar dari produknya. "Kami hanya bisa memasarkan berdasarkan pesanan saja untuk kita memperluas pemasarannya kami masih merasa kesulitan". Ujar mustofa.',
                  style: MyTextStyle.captionH5(color: MyColors.greyBase),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text('Komentar',style: MyTextStyle.buttonH3(color: MyColors.blackBase),)
                ),
                const SizedBox(height: 9,),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width:43,
                        height: 43,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Adinda Yulia', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
                          Container(
                            width: 250,
                            child: Text('Inovasi bisnisnya sangat keren. Semoga dapat menginovasi anak muda saat ini.',
                              style: MyTextStyle.captionH5(color: MyColors.greyBase),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 27,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 221, 255, 0.42),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Beri Komentar', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                      const SizedBox(height: 10,),
                      TextField(
                        minLines: 4,
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Tulis tanggapan anda..',
                            hintStyle: MyTextStyle.captionH5(color: MyColors.grey200),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                          filled: true,
                          fillColor: MyColors.whiteBase
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              visualDensity: VisualDensity(vertical: -1),
                              foregroundColor: MyColors.whiteBase,
                              backgroundColor: MyColors.primaryBase
                            ),
                            child: Text('Kirim')
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
