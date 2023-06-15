import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/screen/webview_page.dart';

class TipComponent extends StatelessWidget {
  final String tipTitle;
  final String tipContent;
  final String imageUrl;
  final String webviewUrl;
  const TipComponent({
    required this.tipTitle,
    required this.tipContent,
    required this.imageUrl,
    required this.webviewUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector( //detect click of the tip component
      //if component clicked, display webview
      onTap: (){
        Get.to(()=>WebviewPage(),arguments: webviewUrl); //route to webview page & send webview Url
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Color(0xffF9F9ff),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            15,10,0,10,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Container(
                    width: 240.0,
                    child: Text(
                      tipTitle,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ), //hospital name
                  SizedBox(
                    height: 5.0,
                  ),
                  //content
                  Container(
                    width: 230.0,
                      child: Text(tipContent)),
                  SizedBox(
                    height: 5.0,
                  ) //hospital address
                ],
              ),
              SizedBox(width: 13.0,),
              //image
              Image.network(
                imageUrl,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
