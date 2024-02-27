import 'package:flutter/material.dart';

class BudgetHistory extends StatelessWidget {
  const BudgetHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text(
            "Budget History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [],
          ),
        )
      ],
    );
  }
}
