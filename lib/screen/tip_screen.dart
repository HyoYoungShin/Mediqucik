import 'package:flutter/material.dart';
import 'package:mediquick/component/tip_component.dart';
import 'package:mediquick/component/top_search_bar.dart';


class TipScreen extends StatelessWidget {
  const TipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TopMenuBar(),
        SizedBox(height: 10.0),
        TopSearchBar(),
        SizedBox(height: 10.0),
        TipList(),
      ],
    );
  }
}

class TipList extends StatelessWidget {
  const TipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            //medical information list
            children: [
              //click component to display webview
              TipComponent(
                tipTitle: '환절기 건강, 이렇게 챙기자',
                tipContent: '숨이 턱턱 막히는 무더위도 기세가 한풀 꺾이고...',
                imageUrl:
                    'https://www.nhis.or.kr/magazin/173/html/style/images/menu_img.jpg',
                webviewUrl: 'https://www.nhis.or.kr/magazin/173/html/sub2.html',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '만성피로증후군을 진단하다',
                tipContent: '만성피로증후군이란 휴식을 취해도 피로가 좋아지지 않고...',
                imageUrl:
                'https://seoul.hyumc.com/upload/ckfinder/images/Magazine/2019_11/2019_11%2B12_%EB%A7%A4%EA%B1%B0%EC%A7%84_22.png',
                webviewUrl: 'https://seoul.hyumc.com/seoul/healthInfo/healthLife.do?action=view&nttSeq=11364',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '정신건강칼럼 5월 : 치매 예방 수칙',
                tipContent: '치매는 정상적으로 생활해오던 사람이 후천적으로 다양한 원인으로 인해...',
                imageUrl:
                'https://psy.amc.seoul.kr/asan/images/homebuilder/common/logo.png',
                webviewUrl: 'https://psy.amc.seoul.kr/asan/depts/psy/K/bbsDetail.do?menuId=862&contentId=263081',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '"이런 증상"있으면 나도 공황장애?',
                tipContent: '공황장애는 특별한 이유 없이 극단적인 불안 증상이 반복적으로 지속되는..',
                imageUrl:
                'https://doctornow.co.kr/_next/image?url=https%3A%2F%2Fd2m9duoqjhyhsq.cloudfront.net%2FmarketingContents%2Farticle%2Farticle52-01.jpg&w=3840&q=75',
                webviewUrl: 'https://doctornow.co.kr/content/magazine/9617050db9af11edae1b06ef18b6ac0c',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
