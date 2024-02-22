import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> allCategory = [
    {
      'categoryId': 1,
      'categoryName': 'Travelling',
      'categoryImage': 'asset/icon/travelling.png',
      'isSelect': false,
    },
    {
      'categoryId': 2,
      'categoryName': 'Salary',
      'categoryImage': 'asset/icon/salary.png',
      'isSelect': false,
    },
    {
      'categoryId': 3,
      'categoryName': 'Rent',
      'categoryImage': 'asset/icon/rent.png',
      'isSelect': false,
    },
    {
      'categoryId': 4,
      'categoryName': 'Recharge',
      'categoryImage': 'asset/icon/recharge.png',
      'isSelect': false,
    },
    {
      'categoryId': 5,
      'categoryName': 'Ott',
      'categoryImage': 'asset/icon/ott.png',
      'isSelect': false,
    },
    {
      'categoryId': 6,
      'categoryName': 'Shopping',
      'categoryImage': 'asset/icon/online-shopping.png',
      'isSelect': false,
    },
    {
      'categoryId': 7,
      'categoryName': 'Loan',
      'categoryImage': 'asset/icon/loan.png',
      'isSelect': false,
    },
    {
      'categoryId': 8,
      'categoryName': 'Hospital',
      'categoryImage': 'asset/icon/hospital.png',
      'isSelect': false,
    },
    {
      'categoryId': 9,
      'categoryName': 'Electricity',
      'categoryImage': 'asset/icon/electrical-energy.png',
      'isSelect': false,
    },
    {
      'categoryId': 10,
      'categoryName': 'Education',
      'categoryImage': 'asset/icon/education.png',
      'isSelect': false,
    },
    {
      'categoryId': 11,
      'categoryName': 'Food',
      'categoryImage': 'asset/icon/diet.png',
      'isSelect': false,
    },
    {
      'categoryId': 12,
      'categoryName': 'Business',
      'categoryImage': 'asset/icon/business-model.png',
      'isSelect': false,
    },
  ];

  void changePage(int val) {
    currentPage.value = val;
  }

  void selectCategory(Map<String, dynamic> data) {
    data['isSelect'] = !data['isSelect'];
    update();
  }
}
