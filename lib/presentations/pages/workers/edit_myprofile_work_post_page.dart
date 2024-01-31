import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield.dart';

class EditMyProfileWorkPostPage extends StatefulWidget {
  EditMyProfileWorkPostPage({super.key});

  @override
  State<EditMyProfileWorkPostPage> createState() => _EditMyProfileWorkPostPageState();
}

class _EditMyProfileWorkPostPageState extends State<EditMyProfileWorkPostPage> {
  TextEditingController workNameController = TextEditingController();

  List<PlatformFile> pickedFiles = [];

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedFiles.addAll(result.files);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postingan', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Pekerjaan', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
            const SizedBox(height: 7,),
            MyTextField(hint: 'Contoh: Pegawai Otomotif',  controller: workNameController,type: 'Secondary',),
            const SizedBox(height: 17,),
            Text('Posisi', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
            const SizedBox(height: 7,),
            MyTextField(hint: 'Contoh: Kasir',  controller: workNameController,type: 'Secondary',),
            const SizedBox(height: 17,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tahun Mulai', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                    const SizedBox(height: 7,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.5,
                        child: MyTextField(hint: 'Contoh: 2010',  controller: workNameController,type: 'Secondary',)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tahun Selesai', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                    const SizedBox(height: 7,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.5,
                        child: MyTextField(hint: 'Contoh: 2011',  controller: workNameController,type: 'Secondary',)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 22,),
            Text('Upload Foto', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
            const SizedBox(height: 7,),
            DottedBorder(
              dashPattern: [3, 3],
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              child: ClipRRect(
                child: Container(
                  width: double.infinity,
                  height: 98,
                  child: pickedFiles == null || pickedFiles.isEmpty ? Center(
                    child: Column(
                      children: [
                        const Spacer(),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: MyColors.grey200,
                            foregroundColor: MyColors.whiteBase,
                          ),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            selectFile();
                          },
                        ),
                        Text('Klik untuk upload', style: MyTextStyle.captionH5(color: MyColors.grey200),),
                        const Spacer(),
                      ],
                    ),
                  ): ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pickedFiles.length + 1,
                    itemBuilder: (context, index) {
                      if (index < pickedFiles.length) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.file(
                              File(pickedFiles[index].path!),
                              width: 83,
                              height: 83,
                            ),
                            SizedBox(
                              width:30,
                              height:30,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: MyColors.grey200,
                                  foregroundColor: MyColors.whiteBase,
                                ),
                                icon: Center(child: Icon(Icons.close, size: 15,)),
                                onPressed: () {
                                  setState(() {
                                    pickedFiles.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      }else {
                        return Center(
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: MyColors.grey200,
                              foregroundColor: MyColors.whiteBase,
                            ),
                            icon: Icon(Icons.add),
                            onPressed: () {
                              selectFile();
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: MyButton(text: 'Simpan', color: MyColors.primaryBase, onPressed: (){}),
            ),
          ],
        ),

      ),
    );
  }
}
