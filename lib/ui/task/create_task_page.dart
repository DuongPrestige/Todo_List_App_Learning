import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../ultils/enums/color_extension.dart';
import '../category/category_list_page.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _nameTaskTextController = TextEditingController();
  final _descTaskTextController = TextEditingController();
  CategoryModel? _categorySelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF363636),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          child: _buildBodayPage(),
        ),
      ),
    );
  }

  Widget _buildBodayPage() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTaskNameField(),
          _buildTaskDescField(),
          if (_categorySelected != null) _buildTaskCategory(),
          _buildTaskActionField(),
        ],
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "create_task_form_name_label",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.87),
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            controller: _nameTaskTextController,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "create_task_form_name_place".tr(),
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFAFAFAF),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFF979797),
                ),
              ),
            ),
            onChanged: (String? value) {
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  Widget _buildTaskDescField() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "create_task_form_desc_label",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFAFAFAF),
            ),
          ).tr(),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _descTaskTextController,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "create_task_form_desc_place".tr(),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFAFAFAF),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFF979797),
                  ),
                ),
              ),
              onChanged: (String? value) {
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTaskCategory() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Task category",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFAFAFAF),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: _buildGridCategoryItem(_categorySelected!),
          )
        ],
      ),
    );
  }

  Widget _buildGridCategoryItem(CategoryModel category) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: category.backgroundColorHex != null
                ? HexColorString(category.backgroundColorHex!)
                : Colors.white,
          ),
          child: category.iconCodePoint != null
              ? Icon(
                  IconData(category.iconCodePoint!,
                      fontFamily: "MaterialIcons"),
                  color: category.iconColorHex != null
                      ? HexColorString(category.iconColorHex!)
                      : Colors.white,
                  size: 40)
              : null,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            category.name,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
      ],
    );
  }

  // Widget _buildGridCategoryItem(CategoryModel category) {
  //   return GestureDetector(
  //     onTap: () {
  //       _onHandleClickCategoryItem(category);
  //     },
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 64,
  //           height: 64,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(8),
  //             color: category.backgroundColorHex != null
  //                 ? HexColorString(category.backgroundColorHex!)
  //                 : Colors.white,
  //           ),
  //           child: category.iconCodePoint != null
  //               ? Icon(
  //                   IconData(category.iconCodePoint!,
  //                       fontFamily: "MaterialIcons"),
  //                   color: category.iconColorHex != null
  //                       ? HexColorString(category.iconColorHex!)
  //                       : Colors.white,
  //                   size: 40)
  //               : null,
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: Text(
  //             category.name,
  //             style: TextStyle(fontSize: 18, color: Colors.white),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTaskActionField() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/timer.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: _showDialogChooseCategory,
                  icon: Image.asset(
                    "assets/images/tag.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/flag.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          //button send
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/send.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  void _showDialogChooseCategory() async {
    final result = await showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return CategoryListPage();
      },
    );

    print(result);
    if (result != null && result is Map<String, dynamic>) {
      //thuc hien
      final categoryId = result["categoryId"];
      if (categoryId == null) {
        return;
      }
      final name = result["name"];
      final iconCodePoint = result["iconCodePoint"];
      final backgroundColorHex = result["backgroundColorHex"];
      final iconColorHex = result["iconColorHex"];

      final categoryModel = CategoryModel(
        id: categoryId,
        name: name,
        iconCodePoint: iconCodePoint,
        backgroundColorHex: backgroundColorHex,
        iconColorHex: iconColorHex,
      );
      setState(() {
        _categorySelected = categoryModel;
      });
    } else {
      //do nothing
    }
  }
}
