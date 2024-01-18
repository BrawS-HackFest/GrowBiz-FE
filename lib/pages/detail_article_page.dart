import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/article/article_bloc.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';
class DetailArticlePage extends StatefulWidget {
  DetailArticlePage({super.key, required this.id});
  int id;

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  TextEditingController commentController = TextEditingController();
  @override
  void initState(){
    super.initState();
    context.read<ArticleBloc>().add(ArticleSingleFetch(id: widget.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel', style: MyTextStyle.judulH5(color: MyColors.blackBase)),
        centerTitle: true,
      ),
      body: BlocConsumer<ArticleBloc, ArticleState>(
              listener: (context, state) {
                if(state is ArticleCommentsSuccess){
                  mySnackBar(context, 'berhasil komen :)');
                  context.read<ArticleBloc>().add(ArticleSingleFetch(id: widget.id));
                  commentController.clear();
                }
              },
              builder: (context, state) {
                if(state is ArticleFailed){
                  return Text(state.error);
                }
                if(state is ArticleLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
               if(state is ArticleSingleSuccess){
                 final articleData = state.articleModel;
                 return ScrollConfiguration(
                   behavior: NoGlowScrollBehavior(),
                   child: SingleChildScrollView(
                     child: Padding(
                       padding: EdgeInsets.all(25),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(articleData.title, style:TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                           const SizedBox(height: 10,),
                           Container(
                             width: double.infinity,
                             height: 202,
                             clipBehavior: Clip.hardEdge,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12)
                             ),
                             child: Image.network(articleData.pict, fit: BoxFit.cover,),
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
                           Text(articleData.desc,
                             style: MyTextStyle.captionH5(color: MyColors.greyBase),
                             textAlign: TextAlign.justify,
                           ),
                           const SizedBox(height: 10,),
                           Align(
                               alignment: Alignment.centerLeft,
                               child: Text('Komentar',style: MyTextStyle.buttonH3(color: MyColors.blackBase),)
                           ),
                           const SizedBox(height: 9,),
                           SizedBox(
                             height:140,
                               child:ListView.separated(itemBuilder: (context, index) {
                                 final comments = articleData.comment;
                                 if(comments != null){
                                   return Container(
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
                                             Text(comments[index]['User']['username'], style: MyTextStyle.judulH4(color: MyColors.blackBase),),
                                             Container(
                                               width: 250,
                                               child: Text(comments[index]['comment'],
                                                 style: MyTextStyle.captionH5(color: MyColors.greyBase),
                                                 textAlign: TextAlign.justify,
                                               ),
                                             )
                                           ],
                                         )
                                       ],
                                     ),
                                   );
                                 }
                                 else{
                                   return Text('Tidak ada article');
                                 }

                               }, separatorBuilder: (context, index) {
                                 return const SizedBox(height: 16,);
                               }, itemCount: articleData.comment?.length ?? 0)
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
                                   controller: commentController,
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
                                       onPressed: (){
                                         context.read<ArticleBloc>().add(ArticleCommentUser(
                                           id: articleData.id,
                                           comment: commentController.text
                                         ));
                                       },
                                       style: ElevatedButton.styleFrom(
                                           elevation: 0,
                                           visualDensity: VisualDensity(vertical: -1),
                                           foregroundColor: MyColors.whiteBase,
                                           backgroundColor: MyColors.primaryBase
                                       ),
                                       child: Text(state is ArticleCommentLoading ? 'Loading...' : 'Kirim')
                                   ),
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                 );
               }
               else{
                 return Container();
               }
              },
),
    );
  }
}
