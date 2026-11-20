import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<BasketItem> items = basket.getItems();

    final List<Widget> children = [];

    if (items.isEmpty) {
      children.add(const Text('Your basket is empty'));
    } else {
      children.add(const Text('Your basket', style: cinemaHeaderStyle));
      for (int index = 0; index < items.length; index++) {
        children.add(_buildLineItem(basket, items[index], index));
      }
      children.add(const SizedBox(height: 16));
      children.add(
        Text(
          'Total: £${basket.getTotal().toStringAsFixed(2)}',
          style: cinemaHeaderStyle,
        ),
      );
      children.add(const SizedBox(height: 16));
      children.add(
        PrimaryButton(
          label: 'Checkout',
          onPressed: () {
            setState(() {
              basket.clear();
              _confirmationMessage = 'Thanks, your tickets are booked';
            });
          },
        ),
      );
    }

    if (_confirmationMessage.isNotEmpty) {
      children.add(const SizedBox(height: 12));
      children.add(Text(_confirmationMessage));
    }

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildLineItem(BasketRepository basket, BasketItem item, int index) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${item.quantity} x ${item.movie.title} '
            '£${item.lineTotal.toStringAsFixed(2)}',
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {
            setState(() {
              basket.removeItem(index);
            });
          },
        ),
      ],
    );
  }
}
