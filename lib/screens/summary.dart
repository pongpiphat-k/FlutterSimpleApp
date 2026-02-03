import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


class MySummary extends StatelessWidget {
  const MySummary({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('PurchaseSummary', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _SummaryList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _SummaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(
      context,
    ).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you for your purchase!'),


            
            const SizedBox(width: 24),
            FilledButton(
              onPressed: () => context.go('/catalog'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}


