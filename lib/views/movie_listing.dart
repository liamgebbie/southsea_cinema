import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBrand,
        child: Column(
          children: [
            Text('${widget.movie.title} (${widget.movie.ageRating})'),
            Text(widget.movie.synopsis),
            Text('Screening: ${widget.movie.screeningTime}'),
            Text('Price: ${widget.movie.formattedPrice}'),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1 ticket'),
                DropdownMenuEntry(value: 2, label: '2 tickets'),
                DropdownMenuEntry(value: 3, label: '3 tickets'),
                DropdownMenuEntry(value: 4, label: '4 tickets'),
                DropdownMenuEntry(value: 5, label: '5 tickets'),
              ],
            ),
            Text('Tickets selected: $_ticketQuantity'),
            PrimaryButton(
              label: 'Add to order',
              onPressed: () {
                BasketRepository.instance.addItem(
                  BasketItem(movie: widget.movie, quantity: _ticketQuantity),
                );
                setState(() {
                  _bookingMessage = 'Added $_ticketQuantity to order';
                });
              },
            ),
            Text(_bookingMessage),
          ],
        ),
      ),
    );
  }
}