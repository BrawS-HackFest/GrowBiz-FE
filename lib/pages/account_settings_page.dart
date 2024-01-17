import 'package:flutter/material.dart';
import 'package:hackfest_mobile/pages/edit_myprofile_page.dart';
import 'package:hackfest_mobile/pages/update_mypassword_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Akun', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.person),
                      Text('Edit profil', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return EditMyProfilePage();
                    },));
                  },
                    child: Icon(Icons.navigate_next)
                )
              ],
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.lock_outline),
                      Text('Ubah kata sandi', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return UpdateMyPasswordPage();
                      },));
                    },
                    child: Icon(Icons.navigate_next)
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
