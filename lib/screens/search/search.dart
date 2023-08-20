import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _selectedRadioValue = 'One-way';
  DateTime _selectedDepartureDate = DateTime.now();
  DateTime _selectedReturnDate = DateTime.now();
  String _selectedTicketType = 'Regular';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'It Is Better To Travel Well Than To Arrive',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 20,
                thickness: 6,
                indent: 5,
                endIndent: 45,
              ),
              Column(
                children: [
                  RadioListTile<String>(
                    title: Text('One-way'),
                    value: 'One-way',
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Round-trip'),
                    value: 'Round-trip',
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Multi-planet'),
                    value: 'Multi-planet',
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value!;
                      });
                    },
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: 'From'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'To'),
              ),
              SizedBox(height: 16.0),
              Text('Departure'),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDepartureDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _selectedDepartureDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Departure Date'),
              ),
              SizedBox(height: 16.0),
              Text('Return'),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedReturnDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _selectedReturnDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Return Date'),
              ),
              SizedBox(height: 16.0),
              Text('Persons'),
              TextField(
                keyboardType: TextInputType.number,
              ),
              Column(
                children: [
                  RadioListTile<String>(
                    title: Text('Regular'),
                    value: 'Regular',
                    groupValue: _selectedTicketType,
                    onChanged: (value) {
                      setState(() {
                        _selectedTicketType = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Premium'),
                    value: 'Premium',
                    groupValue: _selectedTicketType,
                    onChanged: (value) {
                      setState(() {
                        _selectedTicketType = value!;
                      });
                    },
                  ),
                  // Add more radio buttons as needed
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Search Flights'),
                onPressed: () {
                  // Implement your search functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
