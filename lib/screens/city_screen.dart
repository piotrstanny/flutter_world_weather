import 'package:flutter/material.dart';
import 'package:flutter_world_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (input) {
                      cityName = input;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                  ), /**/
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xFF008204))),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                        color: Colors.green,
                      ),
                      child: Text(
                        'Get Weather',
                        style: kButtonTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
