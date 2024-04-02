import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const Text('hai'),
      ),
      body: const Center(
        child: Text('Category Page'),
      ),
    );
  }
}
