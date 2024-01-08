import 'package:flutter/material.dart';
import 'package:hackfest_mobile/pages/payment_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/desc_section.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/review_section.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isDescriptionSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Kursus',
          style: MyTextStyle.judulH5(color: MyColors.blackBase),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/popular1.png',
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Dasar Digital Marketing',
                  style: MyTextStyle.buttonH3(color: MyColors.blackBase),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Teratas',
                  style: MyTextStyle.captionH5(color: MyColors.secondaryBase),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: MyColors.grey200,
                          ),
                          Text(
                            '2.380',
                            style: MyTextStyle.judulH5(color: MyColors.grey200),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.money_outlined,
                            color: MyColors.primaryBase,
                          ),
                          Text(
                            'Rp.50.000',
                            style: MyTextStyle.judulH5(
                                color: MyColors.primaryBase),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyColors.secondaryBase,
                          ),
                          Text(
                            '4,9',
                            style:
                                MyTextStyle.judulH5(color: MyColors.blackBase),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyColors.neutra100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isDescriptionSelected = true;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide.none,
                            backgroundColor: isDescriptionSelected
                                ? MyColors.whiteBase
                                : MyColors.neutra100,
                            foregroundColor: MyColors.greyBase,
                          ),
                          child: Text('Deskripsi'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isDescriptionSelected = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide.none,
                            backgroundColor: !isDescriptionSelected
                                ? MyColors.whiteBase
                                : MyColors.neutra100,
                            foregroundColor: MyColors.greyBase,
                          ),
                          child: Text('Ulasan'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                isDescriptionSelected ? DescSection() : ReviewSection(),
                const SizedBox(height: 19,),
                SizedBox(
                  width: double.infinity,
                    child: MyButton(text: 'Daftar Sekarang', color: MyColors.primaryBase,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return PaymentPage();
                          }));
                        }
                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
