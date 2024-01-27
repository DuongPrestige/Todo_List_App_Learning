import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/entities/category_real_entity.dart';
import 'package:todo_list_app/models/category_model.dart';
import 'package:todo_list_app/ui/category/create_or_edit_category.dart';

import '../../ultils/enums/color_extension.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<CategoryModel> categoryListDataSource = [];
  bool _isEditMode = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, body: _buildBodyPage());
  }

  Widget _buildBodyPage() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Color(0xFF363636)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildChooseCategoryTitle(),
            _buildGridCategoryList(),
            _buildCreateCategoryButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseCategoryTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("create_list_page_title",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.87),
            )).tr(),
        Divider(
          color: Color(0xFF979797),
        )
      ],
    );
  }

  Widget _buildGridCategoryList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final isLastItem = index == categoryListDataSource.length;
        if (isLastItem) {
          return _buildGridCategoryItemCreateNew();
        }
        final category = categoryListDataSource.elementAt(index);
        return _buildGridCategoryItem(category);
      },
      itemCount: categoryListDataSource.length + 1,
    );
  }

  Widget _buildGridCategoryItem(CategoryModel category) {
    return GestureDetector(
      onTap: () {
        _onHandleClickCategoryItem(category);
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: category.backgroundColorHex != null
                    ? HexColorString(category.backgroundColorHex!)
                    : Colors.white,
                border: Border.all(
                    color: _isEditMode ? Colors.orange : Colors.transparent,
                    width: _isEditMode ? 2 : 0)),
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
      ),
    );
  }

  Widget _buildGridCategoryItemCreateNew() {
    return GestureDetector(
      onTap: () {
        _gotoCreateCategoryPage();
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF80FFD1),
            ),
            child: Icon(Icons.add, color: Color(0xFF00A369), size: 30),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              "Create New",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCreateCategoryButton() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107, bottom: 24),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "common_cancle",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Lato",
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.44),
              ),
            ).tr(),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8875FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            child: Text(
              _isEditMode ? "Cancle edit" : "create_list_edit_category_button",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.44),
              ),
            ).tr(),
          )
        ],
      ),
    );
  }

  Future<void> _getCategoryList() async {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);

    final categories = realm.all<CategoryRealmEntity>();
    List<CategoryModel> categoryModels = categories.map((e) {
      return CategoryModel(
        id: e.id.hexString,
        name: e.name,
        iconCodePoint: e.iconCodePoint,
        backgroundColorHex: e.backgroundColorHex,
        iconColorHex: e.iconColorHex,
      );
    }).toList();
    setState(() {
      categoryListDataSource = categoryModels;
    });
  }

  void _gotoCreateCategoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateOrEditCategory()),
    );
  }

  void _onHandleClickCategoryItem(CategoryModel category) {
    if (_isEditMode) {
      //Di den man hinh edit
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateOrEditCategory(
                  categoryId: category.id,
                )),
      );
    } else {
      Navigator.pop(context, {
        "categoryId": category.id,
        "name": category.name,
        "iconCodePoint": category.iconCodePoint,
        "backgroundColorHex": category.backgroundColorHex,
        "iconColorHex": category.iconColorHex,
      });
    }
  }
}
