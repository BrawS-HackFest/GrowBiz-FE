import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/my_textfield_form.dart';

class UpdateMyPasswordPage extends StatelessWidget {
  UpdateMyPasswordPage({super.key});

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah kata sandi', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28,vertical: 28),
        child: Column(
          children: [
            MyTextFieldForm(label: 'Kata sandi baru', hint: '*******', controller:passController , icon: Icons.lock_outline),
            const SizedBox(height: 16,),
            MyTextFieldForm(label: 'Kofirmasi kata sandi baru', hint: '*******', controller:confirmPassController , icon: Icons.lock_outline),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: MyButton(text: 'Update', color: MyColors.primaryBase, onPressed: (){}),
            )
          ],
        ),
      ),
    );
  }
}
