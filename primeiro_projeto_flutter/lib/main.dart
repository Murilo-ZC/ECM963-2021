import 'package:flutter/material.dart';

void main() {
  runApp(minhaAplicacao());
}

Widget minhaAplicacao() {
  return MaterialApp(
    title: "Ola Mundo Flutter",
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home:  Scaffold(
      appBar: AppBar(
        title: Text("Meu App Flutter"),
      ),
      body: Column(
        children: [
          Text("Ola Mundo!"),
          Text("Saitama"),
          Expanded(child: Image.network("https://images.pexels.com/photos/6713934/pexels-photo-6713934.jpeg")),
          Expanded(child: Image.asset("images/bmw.jpg", fit: BoxFit.fill,)),
          Row(
            children: [
              Expanded(child: GestureDetector(
                  child: Image.asset("images/dice1.png"),
                  onTap: (){
                    print("Ola Mundo");
                  },
              )
              ),
              SizedBox(width: 8,),
              Expanded(child: Image.asset("images/dice3.png"))
            ],
          )
        ],
      ),
    ),

  );
}
