import 'package:flutter/material.dart';

class EbooksApostilas extends StatelessWidget {
  static const routeName = '/alunos/ebooks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 500,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(children: <Widget>[
                            // CircleImage(assetImage: 'assets/images/ebook.png', height: 40.0),
                            Text("E-books & Apostilas",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ]),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                          child: Row(children: <Widget>[
                        // CircleLink(buttonText: "CPA 10", height: 35.0, link: ""),
                        // CircleLink(buttonText: "CPA 20", height: 35.0, link: ""),
                        // CircleLink(buttonText: "CEA", height: 35.0, link: "")
                      ])),
                      SizedBox(height: 20.0),
                      Center(
                          child: Row(children: <Widget>[
                        //  CircleLink(buttonText: "CPA 10", height: 35.0, link: ""),
                        //  CircleLink(buttonText: "CPA 20", height: 35.0, link: ""),
                        // CircleLink(buttonText: "CEA", height: 35.0, link: "")
                      ])),
                      SizedBox(height: 40.0),
                      Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              verticalDirection: VerticalDirection.down,
                              children: <Widget>[
                            FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                // side: BorderSide(color: Colors.red)
                              ),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              icon: Icon(Icons.file_download,
                                  color: Colors.white),
                              label: Text('Baixar apostila',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                              padding: EdgeInsets.all(15.0),
                              onPressed: () {},
                            ),
                          ])),
                    ]),
                  ),
                ]),
              ])),
        ),
      ),
    );
  }
}
