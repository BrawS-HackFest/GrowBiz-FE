import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';

class MyTextFieldForm extends StatefulWidget {
  MyTextFieldForm({super.key, required this.label, required this.hint, required this.controller, required this.icon, this.obsecureText = false, this.type = 'text'});

  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  bool obsecureText;
  final String type;

  @override
  State<MyTextFieldForm> createState() => _MyTextFieldFormState();
}

class _MyTextFieldFormState extends State<MyTextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.label}', style: TextStyle(color: MyColors.blackBase, fontWeight: FontWeight.w500),),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: '${widget.hint}',
              hintStyle: TextStyle(color: MyColors.grey300, fontSize: 13),
              prefixIcon: Icon(widget.icon, color: MyColors.grey300,),
              filled: true,
              fillColor: MyColors.neutra100,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
              contentPadding: EdgeInsets.all(10),
            suffixIcon: widget.type=='password'?
            widget.obsecureText ?
                  GestureDetector(
                onTap: (){
                  setState(() {
                    widget.obsecureText = false;
                  });
                },
                child: Icon(Icons.visibility_off_outlined,color: MyColors.grey300,))
                :GestureDetector(
                onTap: (){
                  setState(() {
                    widget.obsecureText = true;
                  });
                },
                child: Icon(Icons.visibility_outlined,color: MyColors.grey300,)
            ) : null,
          ),
          obscureText: widget.obsecureText,

        )
      ],
    );
  }
}
