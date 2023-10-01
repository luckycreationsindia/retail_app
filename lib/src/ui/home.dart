import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/main.dart';
import 'package:retail_app/src/utils/isar_service.dart';
import 'package:retail_app/src/utils/utils.dart';
import 'package:retail_app/src/utils/globals.dart' as globals;

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
          TextButton(
            child: const Text("Reset"),
            onPressed: () {
              showLoading(context, title: "Clearing Data");
              clearData().then((value) {
                initMainData();
              }).catchError((err) {
                printDebug(err);
              }).whenComplete(() {
                IsarService().openDB();
                showSnackMessage(context, "Data Cleared!");
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> clearData() async {
    final isar = globals.db;
    await isar.writeAsync((isar) {
      isar.clear();
    });
  }
}
