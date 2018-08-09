import 'package:flutter/material.dart';

final marsSurfaceGravity=0.38;
final plutoSurfaceGravity=0.06;
final venusSurfaceGravity=0.91;



class PlanetX extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PlanetXState();
  }

}
class PlanetXState extends State<PlanetX>{
  int radioValue = 0;
  double _finalResult =0.0;
  String _formattedText="";
  String _currentImage="earth.jpg";
  final TextEditingController _planetController = TextEditingController();
  // At the top level:
 void handleRadioValueChanged(int value){
   setState(() {
     radioValue = value;
     var weight = int.parse(_planetController.text);
     switch(radioValue){
       case 0:
              _finalResult = calculateWeight(weight,0.06);
              _formattedText ="Your Weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
              _currentImage="pluto.jpg";
         break;
       case 1:
         _finalResult = calculateWeight(weight,0.38);
         _formattedText ="Your Weight on Mars is ${_finalResult.toStringAsFixed(1)}";
         _currentImage="planet.png";
         break;
       case 2:
         _finalResult = calculateWeight(weight,0.91);
         _formattedText ="Your Weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      //   _currentImage="venus.jpg";

         break;


     }
     print("weight $_finalResult");
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor:Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            //image profile
            Padding(padding: EdgeInsets.all(2.5)),
            Image.asset('images/$_currentImage',
            width: 200.5, height: 133.0),
      Container(
        margin: EdgeInsets.all(3.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: _planetController,
              decoration: InputDecoration(
                hintText: "In Pounds",
                labelText: "Your Weight On Earth",
                hintStyle: TextStyle(color: Colors.white),

                icon: Icon(Icons.person_outline),
              ),),
            Padding(padding: EdgeInsets.all(5.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    activeColor: Colors.brown,
                    value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                Text("Pluto",style: TextStyle(color: Colors.white30),),
                Radio(
                    activeColor: Colors.red,
                    value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                Text("Mars",style: TextStyle(color: Colors.white30),),
                Radio(
                    activeColor: Colors.orangeAccent,
                    value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                Text("Venus",style: TextStyle(color: Colors.white30),),
              ],
            ),
            //result text
            Padding(padding: EdgeInsets.all(10.5)),
            Text(
               // "$_formattedText lbs"
              _planetController.text.isEmpty ? "Please enter Weight":_formattedText+" lbs"
                ,style: TextStyle(color: Colors.white,
            fontSize: 19.4,
            fontWeight: FontWeight.w500)),
          ],
        ),
      ),



          ],

        ),
      ),
    );
  }

 double calculateWeight(int weight, double planetCoefficient) {
   if(weight.toString().isNotEmpty && weight > 0 )
     { return weight * planetCoefficient;}
     else
      {print (" Error ");
      return 165.0;}
 }

}