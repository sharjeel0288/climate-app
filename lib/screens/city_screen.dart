// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:clima_app/services/user_api.dart';

// ignore: use_key_in_widget_constructors
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TypeAheadField<User?>(
                  textFieldConfiguration: TextFieldConfiguration(
                    onChanged: (value) {
                      cityName = value;
                    },
                    autofocus: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: kTextFieldInputDecoration,
                  ),
                  suggestionsCallback: UserApi.getUserSuggestions,
                  itemBuilder: (context, User? suggestion) {
                    final user = suggestion!;
                    return ListTile(
                      title: Text(user.cityName),
                    );
                  },
                  onSuggestionSelected: (User? suggestion) {
                    final user = suggestion!;
                    cityName = user.cityName;
                    Navigator.pop(context, cityName);
                  },

                  // style: TextStyle(color: Colors.black),
                  // decoration: kTextFieldInputDecoration,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
