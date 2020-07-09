import 'package:flutter/material.dart';

class MenuItemImage extends StatelessWidget {

  var imageUrl = "";
  var buttonText = "";
  var icon = Icon(Icons.book);
  double width;
  double height;

  MenuItemImage({
    @required this.imageUrl,
    @required this.buttonText,
    @required this.icon,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 18, top: 15, bottom: 5),
      // width: 150,
      // height: 100,
    //   child: ClipRRect(
    //  borderRadius: BorderRadius.circular(15.0),
    //  child: Image.asset(
    //    imageUrl,
    //     width: width,
    //     height: height,
    //     fit: BoxFit.fill,
    //  ),
    child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(imageUrl, width: width, height: height,
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          margin: EdgeInsets.all(5),
        ),
 );
 // Image.asset(imageUrl, height: height),
      // child: Image(image: AssetImage(imageUrl)),
      // child: FlatButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(25.0)
      //   ),
      //   // color: Theme.of(context).primaryColor,
      //   onPressed: () => {},
      //   padding: EdgeInsets.all(10.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       icon,
      //       Text(buttonText)
      //     ],
      //   ),
      // ),
    // );
  }
}