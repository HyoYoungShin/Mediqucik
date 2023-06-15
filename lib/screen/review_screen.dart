import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/component/post_list.dart';
import 'package:mediquick/component/top_search_bar.dart';
import 'package:mediquick/screen/add_review/add_review_screen.dart';


class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        TopSearchBar(),
        SizedBox(height: 10.0),
        //click '병원리뷰 추가' to add new review
        GestureDetector(
          onTap: (){
            Get.to(
                    ()=> AddReviewScreen()
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10.0,8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.add_circle_outline_sharp, size:17.0,),
                SizedBox(width: 5.0,),
                Text('병원리뷰 추가', style: TextStyle(fontSize: 13.0),),
              ],
            ),
          ),
        ),
        //review list
        PostList(),
      ],
    );
  }
}
