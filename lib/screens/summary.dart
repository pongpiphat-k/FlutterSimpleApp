import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_shopper/models/cart.dart';

class MySummary extends StatelessWidget {
  const MySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Summary', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _SummaryList(),
              ),
            ),
            _SummaryTotal(),
          ],
        ),
      ),
    );
  }
}

class _SummaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    if (cart.items.isEmpty) {
      return Center(child: Text('No items purchased.', style: Theme.of(context).textTheme.titleLarge));
    }

    return ListView.separated(
      itemCount: cart.items.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text('Thank you for your purchase!', style: Theme.of(context).textTheme.titleLarge);
        }
        final item = cart.items[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text('- ${item.name}', style: Theme.of(context).textTheme.bodyLarge),
        );
        
      },
    );
  }
}

class _SummaryTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total: \$${cart.totalPrice}', style: Theme.of(context).textTheme.titleLarge),
          FilledButton(
            onPressed: () => context.go('/catalog'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
