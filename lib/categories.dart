import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class Category extends StatefulWidget {
  final String title;

  const Category({Key key, this.title}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildSwiper(),
            flex: 2,
          ),
          Expanded(
            child: buildSubcategories(),
            flex: 1,
          ),
          Expanded(
            child: Container(),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildSubcategories() {
    return Container(
//      height: MediaQuery.of(context).size.height / 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildSingleSubcategory(
            imgLocation: "assets/icons/asalto_ico.png",
            imgCaption: "Asaltos",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/icons/borrachos.png",
            imgCaption: "Borrachos",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/icons/bullyn_ico.png",
            imgCaption: "Bullyn",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/icons/ecuestro.png",
            imgCaption: "Secuestro",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/icons/pelea_ico.png",
            imgCaption: "Peleas",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/icons/robo.png",
            imgCaption: "Robo",
          ),
        ],
      ),
    );
  }

  Widget buildSingleSubcategory({String imgLocation, String imgCaption}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: <Widget>[
              Image.asset(
                imgLocation,
                scale: 3.5,
              ),
              Text(
                imgCaption,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwiper() {
    List<String> imgs = [
      'asalto_ico.png',
      'borrachos.png',
      'bullyn_ico.png',
      'ecuestro.png',
      'pelea_ico.png',
      'robo.png',
    ];

    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
        return Image.asset(
          imgs[i],
          fit: BoxFit.cover,
        );
      },
      autoplay: true,
      duration: 300,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      itemCount: imgs.length,
    );
  }

  Widget buildImgCarousel() {
    return Container(
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/icons/asalto_ico.png'),
          AssetImage('assets/icons/borrachos.png'),
          AssetImage('assets/icons/bullyn_ico.png'),
          AssetImage('assets/icons/ecuestro.png'),
          AssetImage('assets/icons/pelea_ico.png'),
          AssetImage('assets/icons/robo.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 2.0,
        // dotColor: Colors.blue,
      ),
    );
  }
}
