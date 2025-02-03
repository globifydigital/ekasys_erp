import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionListingScreen extends StatefulWidget {
  const TransactionListingScreen({super.key});

  @override
  State<TransactionListingScreen> createState() => _TransactionListingScreenState();
}

class _TransactionListingScreenState extends State<TransactionListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
