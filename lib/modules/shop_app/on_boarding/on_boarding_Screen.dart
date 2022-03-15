import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:udemy/shared/network/local/shared_preferences.dart';
import 'package:udemy/shared/shared_components/components.dart';
class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({
   required this.image,
   required this.title,
   required this.body,
});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController= PageController();
  bool IsLast= false;

  List<BoardingModel> boarding =
  [
    BoardingModel(image: 'https://i.pinimg.com/originals/a4/0c/f0/a40cf03221ab13c4fbc0e7ec711aab50.jpg',
        title: 'On Board 1 Title',
        body: 'On Board 1 Body',
    ),
    BoardingModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEpYm0CAQe9r9LVkwQNdwOCgyLmyYPVQB2_H7iE8nW6SGiUYAwPFnd4On3VLeqIoMsTJk&usqp=CAU',
        title: 'On Board 2 Title',
        body: 'On Board 2 Body',
    ),
    BoardingModel(image: 'https://previews.123rf.com/images/surfupvector/surfupvector2003/surfupvector200300125/141950243-vater-und-sohn-kaufen-lebensmittel-im-supermarkt-junger-mann-und-junge-rollen-einkaufswagen-mit-esse.jpg',
        title: 'On Board 3 Title',
        body: 'On Board 3 Body',
    ),
  ];
  // void submit (){
  //
  //   CacheHelper.SaveData(key: 'onBoarding', value: true,
  //
  //   ).then((value) {
  //
  //     if (value){
  //
  //       navigateAndFinish(context, ShopLoginScreen());
  //
  //     }
  //   }
  //   );
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          TextButton(onPressed:()
          {
           navicateAndFinished(context, ShopLoginScreen());
          },
              child: Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  if(index == boarding.length-1)
                  {
                  print('Last');
                  setState(() {
                    IsLast = true;
                  });
                  }else
                  {
                    print('not last');
                    setState(() {
                      IsLast = false;
                    });
                  }
                },
                controller: boardController,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,

              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.deepOrange,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4.0,
                    ),
                    count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(IsLast){
                      navicateAndFinished(context, ShopLoginScreen());
                    }else{
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.linearToEaseOut,
                      );
                    }

                  },
                child: Icon(Icons.arrow_forward_ios),)

              ],
            ),
          ],
        ),
      ) ,
    );
  }


  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        child: Image(
          image: NetworkImage('${model.image}'),

        ),
      ),
      SizedBox(height: 30.0),
      Text(
        ' ${model.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      SizedBox(height: 15.0),
      Text(
        '${model.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      SizedBox(height: 50.0),
    ],
  );
}
