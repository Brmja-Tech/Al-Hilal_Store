import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String selectedCountryCode = "AE";
  String selectedCountryName = "United Arab Emirates";

  /// Converts a country code into a flag emoji
  String getFlagEmoji(String countryCode) {
    return countryCode
        .toUpperCase()
        .runes
        .map((rune) => String.fromCharCode(0x1F1E6 - 65 + rune))
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                setState(() {
                  selectedCountryCode = country.countryCode;
                  selectedCountryName = country.name;
                });
              },
            );
          },
          child: Row(
            children: [
              Text(
                getFlagEmoji(selectedCountryCode),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 8),
              Text(selectedCountryCode),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }
}
