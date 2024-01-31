import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield.dart';
import 'package:GrowBiz/presentations/widgets/scrollbehavior.dart';

class EditMyProfileWorkPage extends StatelessWidget {
  EditMyProfileWorkPage({super.key});
  TextEditingController  typeOfWorkController = TextEditingController();
  TextEditingController  salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Detail', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                Text('Jenis Pekerjaan', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                const SizedBox(height: 7,),
                MyTextField(hint:'Pegawai Toko Fashion' , controller:typeOfWorkController ,type: 'Secondary',),
                const SizedBox(height: 17,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gaji/bln', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                        const SizedBox(height: 7,),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: MyTextField(controller:salaryController, hint: '3.000.000', type: 'secondary',)
                        )
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Model Kerja', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                        const SizedBox(height: 7,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2.5,
                          child: DropdownMenu(
                            hintText: 'Pilih Model Kerja',

                            dropdownMenuEntries: [
                              DropdownMenuEntry(label: 'Kantor', value: 'kantor'),
                              DropdownMenuEntry(label: 'Jarak Jauh', value: 'jauh'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Text('Tentang Saya', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                Text('Deskripsikan diri anda!', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                const SizedBox(height: 7,),
                TextField(
                  minLines: 4,
                  maxLines: 4,
                  style: MyTextStyle.captionH5(color: MyColors.greyBase),
                  textAlign: TextAlign.justify,
                  controller: TextEditingController(text: "Saya berpengalaman dalam bekerja di bidang fashion. Sebagai anak muda, saya dapat mengetahui trend fashion yang kini ramai di kalangan remaja."),
                  decoration: InputDecoration(
                      hintText: 'Isi Deskripsi diri anda!',
                      hintStyle: MyTextStyle.captionH5(color: MyColors.grey200),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.3,
                          color: MyColors.grey200
                        )
                      ),
                      filled: true,
                      fillColor: MyColors.whiteBase
                  ),
                ),
                const SizedBox(height: 20,),
                Text('Skill', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width/1.9,
                      child: TextField(
                        style: MyTextStyle.captionH5(color: MyColors.grey200),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grey200, width: 1.0),
                          ),
                          hintText: 'Contoh, Sabar',
                          hintStyle: MyTextStyle.captionH5(color: MyColors.grey200),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.neutral,
                          foregroundColor: MyColors.greyBase,
                          elevation: 0
                        ),
                        child: Text('Tambah')
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Icon(Icons.circle_rounded, color: MyColors.primaryBase, size: 10),
                          const SizedBox(width: 5,),
                          Text('skill $index', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 5,);
                  },
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                    child: MyButton(text: 'Simpan', color: MyColors.primaryBase, onPressed: (){})
                ),
                const SizedBox(height: 20,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
