import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xFF58C6F3),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white, fontSize: 12),
            headline1: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            headline3: TextStyle(color: Colors.white, fontSize: 25),
            headline4: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final double sizeI = 60;
  final double padL = 40;
  final double padR = 20;

  final List<String> recipes = [
    'Preheat oven to 375 degrees F. Line a baking pan with parchment paper and set aside.',
    'In a separate bowl mix flour, baking soda, salt, baking powder. Set aside.',
    'Cream together butter and sugars.',
    'Beat in eggs and vanilla untol fluffy.'
  ];
  final List<String> ingredients = ['butter', 'chocolate', 'egg', 'oil', 'sugar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: padL, right: padR),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => null,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () => null,
                    padding: EdgeInsets.only(right: padR),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text('CHOCOLATE CHIP', style: Theme.of(context).textTheme.headline3),
              SizedBox(height: 5,),
              Text('COOKIE', style: Theme.of(context).textTheme.headline1),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/cookie.png', width: MediaQuery.of(context).size.width / 1.5)),
              Text('INGREDIENTS', style: Theme.of(context).textTheme.headline4),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: sizeI,
                child: ListView.builder(
                    itemCount: ingredients.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: sizeI,
                        height: sizeI,
                        decoration: BoxDecoration(
                            color: Color(0xFF2E9FE1),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage('assets/images/ingredients/${ingredients[i]}.png'))),
                      );
                    }),
              ),
              Text('RECIPE', style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 15,),
              ...recipes
                  .asMap()
                  .map((index, recipe) => MapEntry(
                      index,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text('${index + 1}.', style: Theme.of(context).textTheme.bodyText1,),
                            ),
                            Expanded(flex: 8, child: Text(recipe, style: Theme.of(context).textTheme.bodyText1,))
                          ],
                        ),
                      )))
                  .values
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
