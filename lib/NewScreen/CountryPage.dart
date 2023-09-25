import 'package:chatpp/Models/CountryModel.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  final Function setCountryData;
  const CountryPage(this.setCountryData);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String countryName = "India";
String countryCode = "+91";  
  List<CountryModel> countries = [
    CountryModel("India", "+91", "🇮🇳"),
    CountryModel("Pakistan", "+92", "🇵🇰"),
    CountryModel("United States", "+1", "🇺🇸"),
    CountryModel("South Africa", "+27", "🇿🇦"),
    CountryModel("Afghanistan", "+93", "🇦🇫"),
    CountryModel("United Kingdom", "+44", "🇬🇧"),
    CountryModel("Italy", "+39", "🇮🇹"),
    CountryModel("India", "+91", "🇮🇳"),
    CountryModel("Pakistan", "+92", "🇵🇰"),
    CountryModel("United States", "+1", "🇺🇸"),
    CountryModel("South Africa", "+27", "🇿🇦"),
    CountryModel("Afghanistan", "+93", "🇦🇫"),
    CountryModel("United Kingdom", "+44", "🇬🇧"),
    CountryModel("Italy", "+39", "🇮🇹"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(onTap: () {
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.white,
          title: Text(
            "Choose a Country",
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              wordSpacing: 1,
            ),
          )),
    );
  }

  Widget card(CountryModel country) {
    return InkWell(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(country.flag),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Text(country.name),
              Expanded(
                child: Container(
                  width: 150,
                  child: Text(country.code),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 
}
