import 'package:expence_tracker/module/utils/category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
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
                    const SliverAppBar(
                      title: Text(
                        "Categories",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: allCategory.length,
                        (context, index) => Card(
                          color: Colors.lightGreen.withOpacity(0.2),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  allCategory[index]['categoryImage'],
                                  height: 80,
                                ),
                                Text(
                                  "${allCategory[index]['categoryName']}",
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
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                    )
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
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (val) {
                    setState(() {
                      currentIndex = val;
                    });
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.lightGreen,
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
          ],
        ),
      ),
    );
  }
}
