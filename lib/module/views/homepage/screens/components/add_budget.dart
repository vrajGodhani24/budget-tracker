import 'package:expence_tracker/module/views/homepage/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBudget extends StatelessWidget {
  const AddBudget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    HomePageController homePageController = Get.put(HomePageController());

    return Container(
      alignment: Alignment.topCenter,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Add Budget",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: "Add a note",
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            DateTime? selectDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2025),
                              initialDate: homePageController.dateTime,
                            );

                            homePageController.selectDate(selectDate);
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                        Obx(
                          () {
                            return Text(
                              homePageController.date.value,
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            TimeOfDay? selectTime = await showTimePicker(
                              context: context,
                              initialTime: homePageController.timeOfDay,
                            );

                            homePageController.selectTime(selectTime);
                          },
                          icon: const Icon(Icons.timer),
                        ),
                        Obx(
                          () {
                            return Text(
                              homePageController.time.value,
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
