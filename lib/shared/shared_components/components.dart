

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy/modules/web_view/web_view.dart';

import '../../layout/shop_app/cubit/cubit.dart';

Widget defaultButton({
  required double width,
  required Color background,
  required Function function,
  required String text,
})=>
    Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: ()
    {
      function();
    },
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
Widget buildTaskItem(Map model) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
            '${model['time']}'
        ),
      ),
      SizedBox(width: 20.0,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ' ${model['title']}',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5.0 ,),
          Text(
            '${model['date']}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[400],
            ),
          ),
        ],
      )
    ],
  ),
);

Widget MyDevider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget buildArticleItem(article, context) => InkWell(
  onTap: ()
  {
    navicateTo(context, WebViewScreen(url: article['url']));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120.0,
  
          height: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0,),
  
            image: DecorationImage(
  
              fit: BoxFit.cover,
  
              image:
  
              NetworkImage('${article['urlToImage']}'),
  
            ),
  
          ),
  
        ),
  
        SizedBox(width: 5.0,),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${article['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 3,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
                  style: TextStyle(
  
                      fontSize: 18.0,
  
                      color: Colors.grey
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);
void navicateTo(context, Widget) =>Navigator.push(context,
  MaterialPageRoute(builder:(context) => Widget ,
  ));
Widget articleBuilder(list, context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context, index) => buildArticleItem(list[index],context),
    separatorBuilder: (context, index) => MyDevider() ,
    itemCount:list.length );
void navicateAndFinished(context, Widget) =>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder:(context) => Widget ,
    ),
    (Route<dynamic> route) => false,
);
void ShowToast({
  required String text,
  required ToastStates state
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: ChooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
 enum ToastStates{SUCCESS, ERROR, WARNING}
 Color ChooseToastColor(ToastStates state)
 {
   late Color color ;

   switch(state)
   {
     case ToastStates.SUCCESS:
       color = Colors.green ;
       break;
     case ToastStates.ERROR:
       color =  Colors.red ;
       break;
     case ToastStates.WARNING:
       color = Colors.amber ;
       break;
   }
   return color ;

 }

void printFullText (String text){
  final pattern =RegExp('.{1.800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));

}
Widget buildListProduct( model, context, {bool  isOldPrice = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              // fit: BoxFit.cover,
              image: NetworkImage(model.image!),
              height: 120.0,
              width: 120.0,
            ),
            if(model.discount != 0 && isOldPrice)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,),
                color: Colors.red,
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  height: 1.3,
                ),
              ),
              Spacer(),
              Row(
                  children:
                  [
                    Text(
                      model.price.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    if(model.discount != 0 && isOldPrice)
                      Text(
                        model.oldPrice.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorites(model.id!);
                        // print(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor:  ShopCubit.get(context).favorites[model.id]! ?Colors.deepOrange : Colors.grey[300],
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                          size: 17.0,
                        ),
                      ),

                    ),
                  ]
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
// late Color color;
// if(ToastStates.SUCCESS ==true)
// color= Colors.green;
// if(ToastStates.ERROR ==true)
// color= Colors.red;
// else color= Colors.yellow;
// return color;