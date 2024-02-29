import 'dart:typed_data';

import 'package:expence_tracker/module/views/homepage/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetHistory extends StatelessWidget {
  const BudgetHistory({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text(
            "Budget History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
        ),
        GetBuilder<HomePageController>(builder: (controller) {
          return SliverList(
            delegate: SliverChildListDelegate(
              homePageController.fetchedBudget.map(
                (e) {
                  Uint8List image = homePageController
                      .budgetImage("${e['category']}") as Uint8List;
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (e['type'] == 'Expense')
                          ? Colors.red.withOpacity(0.2)
                          : Colors.green.shade800.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: (e['type'] == 'Expense')
                            ? Colors.red
                            : Colors.green.shade800,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        "${e['category']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Image.memory(image),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Note: ${e['note']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date: ${e['date']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Time: ${e['time']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Payment Method: ${e['method']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Payment Type: ${e['type']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "${e['amount']} Rs",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: (e['type'] == 'Expense')
                                  ? Colors.red
                                  : Colors.green.shade800),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          );
        })
      ],
    );
  }
}
