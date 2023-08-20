import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelScreen extends StatefulWidget {
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Travels',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 20,
            thickness: 6,
            indent: 20,
            endIndent: 45,
          ),
          // Horizontal line
          SizedBox(height: 10),
          // View ticket button
          GestureDetector(
            onTap: () {
              // Do something when the button is tapped.
            },
            child: Container(
              alignment: Alignment.center,
              height: 43,
              width: 248,
              decoration: BoxDecoration(
                color: Color(0xFF373d42),
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.airplane_ticket),
                SizedBox(width: 10),
                Text(
                  'View Ticket',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ]),
              margin: EdgeInsets.only(left: 10),
            ),
          ),
          // 3 buttons in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.airplane_ticket),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.hotel),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.car_rental),
                onPressed: () {},
              ),
            ],
          ),
          // 3 rows of travel information

          Row(
            children: [
              Text('Departure'),
              Text('Arrival'),
              Text('Date'),
            ],
          ),
          Row(
            children: [
              Text('Airline'),
              Text('Flight Number'),
              Text('Seat'),
            ],
          ),
          Row(
            children: [
              Text('Duration'),
              Text('Price'),
              Text('Status'),
            ],
          ),

          // Bottom navigation bar
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0x25FFFFFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/seach.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/booking.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
