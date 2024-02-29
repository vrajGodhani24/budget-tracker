import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:expence_tracker/module/helper/database_helper.dart';
import 'package:expence_tracker/module/model/category.dart';
import 'package:expence_tracker/module/views/homepage/model/fetch_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPage = 0.obs;

  List<FetchedCategory> fetchedCategory = [];
  List<Map<String, Object?>> fetchedBudget = [];
  PageController pageController = PageController();
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  TextEditingController moneyController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  RxString date = "".obs;
  RxString time = "".obs;
  RxString selCategory = "".obs;
  RxString selPaymentMethod = "".obs;
  RxString selType = "".obs;

  RxBool addBudgetIconVisibleOrNot = false.obs;

  List<CategoryData> allCategory = [
    CategoryData(
        categoryName: "Travelling",
        categoryImage: "asset/icon/travelling.png",
        isSelect: false),
    CategoryData(
        categoryName: "Salary",
        categoryImage: "asset/icon/salary.png",
        isSelect: false),
    CategoryData(
        categoryName: "Rent",
        categoryImage: "asset/icon/rent.png",
        isSelect: false),
    CategoryData(
        categoryName: "Recharge",
        categoryImage: "asset/icon/recharge.png",
        isSelect: false),
    CategoryData(
        categoryName: "Ott",
        categoryImage: "asset/icon/ott.png",
        isSelect: false),
    CategoryData(
        categoryName: "Shopping",
        categoryImage: "asset/icon/online-shopping.png",
        isSelect: false),
    CategoryData(
        categoryName: "Loan",
        categoryImage: "asset/icon/loan.png",
        isSelect: false),
    CategoryData(
        categoryName: "Hospital",
        categoryImage: "asset/icon/hospital.png",
        isSelect: false),
    CategoryData(
        categoryName: "Electricity",
        categoryImage: "asset/icon/electrical-energy.png",
        isSelect: false),
    CategoryData(
        categoryName: "Education",
        categoryImage: "asset/icon/education.png",
        isSelect: false),
    CategoryData(
        categoryName: "Food",
        categoryImage: "asset/icon/diet.png",
        isSelect: false),
    CategoryData(
        categoryName: "Business",
        categoryImage: "asset/icon/business-model.png",
        isSelect: false),
  ];

  RxBool isVisible = false.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchedCategory = await DBHelper.dbHelper.fetchCategoryAllData();
    fetchedBudget = await DBHelper.dbHelper.fetchAllBudget();

    date.value = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    time.value =
        "${timeOfDay.hour}:${timeOfDay.minute} ${timeOfDay.period.name}";

    fetchTimeRemoveCategory();
  }

  Object? budgetImage(String categoryName) {
    Object? image;

    for (var element in fetchedCategory) {
      if (element.catName == categoryName) {
        image = element.catImage;
      }
    }
    return image;
  }

  Future<void> insertBudgetData(BuildContext ctx) async {
    await DBHelper.dbHelper
        .insertBudget(
            moneyController.text,
            noteController.text,
            date.value,
            time.value,
            selPaymentMethod.value,
            selType.value,
            selCategory.value)
        .then((value) {
      SnackBar snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Success!',
          message: 'Budget ${moneyController.text} added successfully!!',
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(ctx)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      noteController.clear();
      moneyController.clear();
      date.value = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
      time.value =
          "${timeOfDay.hour}:${timeOfDay.minute} ${timeOfDay.period.name}";
      selPaymentMethod.value = "";
      selType.value = "";
      selCategory.value = "";
      iconVisibleOrNot();
    });
  }

  void iconVisibleOrNot() {
    if (moneyController.text.isNotEmpty &&
        noteController.text.isNotEmpty &&
        selCategory.value != "" &&
        selPaymentMethod.value != "" &&
        selType.value != "") {
      addBudgetIconVisibleOrNot.value = true;
    } else {
      addBudgetIconVisibleOrNot.value = false;
    }
  }

  void changedSelPaymentMethod(String? val) {
    selPaymentMethod.value = val!;
    iconVisibleOrNot();
  }

  void changedSelType(String? val) {
    selType.value = val!;
    iconVisibleOrNot();
  }

  void setSelectedCategory(String val) {
    selCategory.value = val;
    iconVisibleOrNot();
  }

  void fetchTimeRemoveCategory() {
    List<CategoryData> toRemoveCategory = [];

    for (var element in fetchedCategory) {
      for (var e in allCategory) {
        if (e.categoryName == element.catName) {
          toRemoveCategory.add(e);
        }
      }
    }

    allCategory.removeWhere((element) => toRemoveCategory.contains(element));
    update();
  }

  void selectDate(DateTime? selectDate) {
    date.value = "${selectDate!.day}/${selectDate.month}/${selectDate.year}";
  }

  void selectTime(TimeOfDay? selectTime) {
    time.value =
        "${selectTime!.hour}:${selectTime.minute} ${selectTime.period.name}";
  }

  void iconVisibility() {
    int bug = 0;
    for (var element in allCategory) {
      if (element.isSelect == false) {
        bug++;
      }
    }

    if (bug == allCategory.length) {
      isVisible.value = false;
    } else {
      isVisible.value = true;
    }
  }

  void removeCategory(CategoryData data) {
    allCategory.remove(data);
    update();
  }

  Future<void> changePage(int val) async {
    fetchedCategory = await DBHelper.dbHelper.fetchCategoryAllData();
    fetchedBudget = await DBHelper.dbHelper.fetchAllBudget();
    currentPage.value = val;
    pageController.animateToPage(
      val,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void selectCategory(CategoryData data) {
    data.isSelect = !data.isSelect;
    update();
  }

  void uploadedCategory(CategoryData data) {
    data.isSelect = false;
    update();
  }
}
