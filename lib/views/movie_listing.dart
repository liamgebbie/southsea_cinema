import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(color: Colors.lightBlueAccent, child: Column(
        children: [
          Text('GoodFellas (1990) (18)'),
          Text('The story of Henry Hill and his life in the mafia, covering his relationship with his wife Karen and his mob partners Jimmy Conway and Tommy DeVito.'),
          Text('Runtime: 145 mins'),
          DropdownMenu<int>(
            initialSelection: 1,
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  _ticketQuantity = value;
                });
              }
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1 ticket'),
              DropdownMenuEntry(value: 2, label: '2 tickets'),
              DropdownMenuEntry(value: 3, label: '3 tickets'),
              DropdownMenuEntry(value: 4, label: '4 tickets'),
              DropdownMenuEntry(value: 5, label: '5 tickets')
            ],
          ),
          Text('Tickets selected: $_ticketQuantity'),
          ElevatedButton(onPressed: () {
            setState(() {
              _bookingMessage = "Added $_ticketQuantity to order";
            });;
          }, 
          child: Text("Add to order"),
          ),
          Text(_bookingMessage)
        ]))
    );
  }
}

