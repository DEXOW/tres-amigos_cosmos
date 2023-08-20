import 'package:cosmos/screens/components/animated_star_background.dart';
import 'package:cosmos/screens/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedRadioValue = 'One-Way';
  String _selectedDropDownValue = "Regular";
  int _noOfPerson = 1;
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedStarBackground(screenHeight: screenHeight, screenWidth: screenWidth),
            Positioned(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'It Is Better To Travel Well Than To Arrive',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 7.5,
                              width: screenWidth * 0.75,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RadioMenuButton(value: "One-Way", groupValue: _selectedRadioValue, onChanged: ((value) {
                                  setState(() {
                                    _selectedRadioValue = value!;
                                  });
                                }), child: const Text("One-Way")),
                                RadioMenuButton(value: "Two-Way", groupValue: _selectedRadioValue, onChanged: ((value) {
                                  setState(() {
                                    _selectedRadioValue = value!;
                                  });
                                }), child: const Text("Two-Way")),
                                RadioMenuButton(value: "Multi-Planet", groupValue: _selectedRadioValue, onChanged: ((value) {
                                  setState(() {
                                    _selectedRadioValue = value!;
                                  });
                                }), child: const Text("Multi-Planet")),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            inputField(
                              labelText: "From",
                              hintText: "Enter Planet",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            inputField(
                              labelText: "To",
                              hintText: "Enter Planet",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dateInput(
                                  labelText: "Departure",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                dateInput(
                                  labelText: "Return",
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0xFF7C7C7D),
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: (){
                                            setState(() {
                                              if(_noOfPerson > 1){
                                                _noOfPerson--;
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_left_rounded, 
                                            color: Colors.white, 
                                            size: 24,
                                          ),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                        Text(
                                          _noOfPerson.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: (){
                                            setState(() {
                                              _noOfPerson++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right_rounded, 
                                            color: Colors.white, 
                                            size: 24,
                                          ),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                                Positioned(
                                  top: 0,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF21282E),
                                    ),
                                    child: Text(
                                      'Persons',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 0.75),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                DropdownButtonFormField(
                                  value: _selectedDropDownValue,
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Regular",
                                      child: Text("Regular"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Luxury",
                                      child: Text("Luxury"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Armed Forces",
                                      child: Text("Armed Forces"),
                                    ),
                                  ], 
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedDropDownValue = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFC7C9CB),
                                        width: 0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFC7C9CB),
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF5C6166),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextButton(
                                onPressed: (){},
                                child: const Text(
                                  "Search Ships",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0x25FFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return const NavBar(currentScreen: 1,);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField({
    labelText,
    hintText,
  }){
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xFFC7C9CB),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xFFC7C9CB),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF21282E),
            ),
            child: Text(
              labelText,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.75),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ),
        ),
      ],
    );
  }

  Widget dateInput({
    labelText,
  }){
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFF7C7C7D),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 ),
            child: const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "28 JUN'22",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Tuesday",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 29,
                ),
                Icon(
                  Icons.calendar_today_outlined, 
                  color: Colors.white, 
                  size: 24,
                ),
              ],
            ),
          )
        ),
        Positioned(
          top: 0,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF21282E),
            ),
            child: Text(
              labelText,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.75),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ),
        ),
      ],
    );
  }
}