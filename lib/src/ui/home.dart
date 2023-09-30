import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            child: const Text("Categories"),
            onPressed: () => context.push('/categories'),
          ),
          TextButton(
            child: const Text("Products"),
            onPressed: () => context.push('/products'),
          ),
          TextButton(
            child: const Text("Orders"),
            onPressed: () => context.push('/orders'),
          ),
        ],
      ),
    );
  }
}
