import 'package:expence_tracker/module/helper/database_helper.dart';
import 'package:expence_tracker/module/views/homepage/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.lightGreen.shade300,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: const Text(
                        "Categories",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.done),
                        ),
                      ],
                      backgroundColor: Colors.transparent,
                    ),
                    GetBuilder<HomePageController>(builder: (controller) {
                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: homePageController.allCategory.length,
                          (context, index) => GestureDetector(
                            onTap: () {
                              homePageController.selectCategory(
                                  homePageController.allCategory[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18),
                                border: (homePageController.allCategory[index]
                                        ['isSelect'])
                                    ? Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    homePageController.allCategory[index]
                                        ['categoryImage'],
                                    height: 80,
                                  ),
                                  Text(
                                    "${homePageController.allCategory[index]['categoryName']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(0.75),
                ),
                child: Obx(
                  () => BottomNavigationBar(
                    currentIndex: homePageController.currentPage.value,
                    onTap: (val) {
                      homePageController.changePage(val);
                    },
                    elevation: 0,
                    type: BottomNavigationBarType.shifting,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.lightGreen.shade200,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on),
                        label: 'Add Budget',
                        backgroundColor: Colors.transparent,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        label: 'Add Category',
                        backgroundColor: Colors.transparent,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history),
                        label: 'Budget History',
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
