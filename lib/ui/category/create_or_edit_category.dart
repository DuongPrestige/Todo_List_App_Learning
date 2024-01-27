import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/ultils/enums/color_extension.dart';

import '../../entities/category_real_entity.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController();
  final List<Color> _colorDataSource = [];
  late Color _colorSelected = Color(0xFFC9CC41);
  late Color _iconcolorSelected = Color(0xFF66CC41);
  IconData? _iconSelected;

  @override
  void initState() {
    super.initState();

    final stroragePath = Configuration.defaultRealmPath;
    print("Đường dẫn của default.realm:" + stroragePath);

    _colorDataSource.addAll([
      Color(0xFFC9CC41),
      Color(0xFF66CC41),
      Color(0xFF41CCA7),
      Color(0xFF4181CC),
      Color(0xFF41A2CC),
      Color(0xFFCC8441),
      Color(0xFF9741CC),
      Color(0xFFCC4173),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "create_category_page_title",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ).tr(),
      ),
      body: _buildBodayPageScreen(),
    );
  }

  Widget _buildBodayPageScreen() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryNameField(),
                _buildCategoryChooseIconField(),
                _buidCategoryChooseBackgroundColorField(),
                _buidCategoryChooseIconAndTextColorField(),
                _buidCategoryPreview(),
              ],
            ),
          ),
          _buildCancleAndCreateOrEditCatergoryButton(),
        ],
      ),
    );
  }

  Widget _buildCategoryNameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("create_category_form_catergory_name_label".tr()),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _nameCategoryTextController,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText:
                    "create_category_form_catergory_name_placeholder".tr(),
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

  Widget _buildCategoryChooseIconField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("create_category_form_catergory_icon_lable".tr()),
          GestureDetector(
            onTap: _chooseIcon,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white.withOpacity(0.21)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _iconSelected != null
                    ? Icon(
                        _iconSelected,
                        color: Colors.white,
                        size: 26,
                      )
                    : const Text(
                        "create_category_form_catergory_icon_placeholder",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ).tr(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buidCategoryChooseIconAndTextColorField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField(
              "create_category_form_catergory_icon_text_color_lable".tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _onChooseCategoryIconTextColor,
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36 / 2),
                  color: _iconcolorSelected,
                ),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   width: double.infinity,
          //   height: 36,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       final color = _colorDataSource.elementAt(index);
          //       final isSelected = _colorSelected == color;
          //       return GestureDetector(
          //         onTap: () {
          //           print("choose color in index $index");
          //           setState(() {
          //             _colorSelected = color;
          //           });
          //         },
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: const EdgeInsets.only(right: 12),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(36 / 2),
          //             color: color,
          //           ),
          //           child: isSelected
          //               ? Icon(
          //                   Icons.check,
          //                   color: Colors.white,
          //                   size: 20,
          //                 )
          //               : null,
          //         ),
          //       );
          //     },
          //     itemCount: _colorDataSource.length,
          //   ),
          // ),
        ],
      ),
    );
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         width: double.infinity,
    //         height: 36,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemBuilder: (context, index) {
    //             final color = _colorDataSource.elementAt(index);
    //             final isSelected = _colorSelected == color;
    //             return GestureDetector(
    //               onTap: () {
    //                 print("choose color in index $index");
    //                 setState(() {
    //                   _colorSelected = color;
    //                 });
    //               },
    //               child: Container(
    //                 width: 36,
    //                 height: 36,
    //                 margin: const EdgeInsets.only(right: 12),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(36 / 2),
    //                   color: color,
    //                 ),
    //                 child: isSelected
    //                     ? Icon(
    //                         Icons.check,
    //                         color: Colors.white,
    //                         size: 20,
    //                       )
    //                     : null,
    //               ),
    //             );
    //           },
    //           itemCount: _colorDataSource.length,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buidCategoryChooseBackgroundColorField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField(
              "create_category_form_catergory_background_color_lable".tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _onChooseCategoryBackgroundColor,
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36 / 2),
                  color: _colorSelected,
                ),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   width: double.infinity,
          //   height: 36,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       final color = _colorDataSource.elementAt(index);
          //       final isSelected = _colorSelected == color;
          //       return GestureDetector(
          //         onTap: () {
          //           print("choose color in index $index");
          //           setState(() {
          //             _colorSelected = color;
          //           });
          //         },
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: const EdgeInsets.only(right: 12),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(36 / 2),
          //             color: color,
          //           ),
          //           child: isSelected
          //               ? Icon(
          //                   Icons.check,
          //                   color: Colors.white,
          //                   size: 20,
          //                 )
          //               : null,
          //         ),
          //       );
          //     },
          //     itemCount: _colorDataSource.length,
          //   ),
          // ),
        ],
      ),
    );
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         width: double.infinity,
    //         height: 36,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemBuilder: (context, index) {
    //             final color = _colorDataSource.elementAt(index);
    //             final isSelected = _colorSelected == color;
    //             return GestureDetector(
    //               onTap: () {
    //                 print("choose color in index $index");
    //                 setState(() {
    //                   _colorSelected = color;
    //                 });
    //               },
    //               child: Container(
    //                 width: 36,
    //                 height: 36,
    //                 margin: const EdgeInsets.only(right: 12),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(36 / 2),
    //                   color: color,
    //                 ),
    //                 child: isSelected
    //                     ? Icon(
    //                         Icons.check,
    //                         color: Colors.white,
    //                         size: 20,
    //                       )
    //                     : null,
    //               ),
    //             );
    //           },
    //           itemCount: _colorDataSource.length,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildTitleField(String titleLable) {
    return Text(
      titleLable,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.87),
      ),
    );
  }

  Widget _buildCancleAndCreateOrEditCatergoryButton() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 20, bottom: 24),
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
              ).tr()),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                _onHandleCreateCategory();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8875FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              child: Text(
                "create_category_create_button",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.44),
                ),
              ).tr())
        ],
      ),
    );
  }

  Widget _buidCategoryPreview() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("create_category_form_catergory_preview_lable".tr()),
          Column(
            children: [
              Container(
                width: 64,
                height: 64,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _colorSelected,
                ),
                child: Icon(_iconSelected, color: _iconcolorSelected, size: 40),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  _nameCategoryTextController.text,
                  style: TextStyle(fontSize: 18, color: _iconcolorSelected),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onHandleCreateCategory() async {
    try {
      final categoryName = _nameCategoryTextController.text;
      if (categoryName.isEmpty) {
        //do nothing
        //show thong bao loi len man hinh cho user biet
        _showAlert("Validation", "Category name is required");

        return;
      }
      if (_iconSelected == null) {
        //do nothing
        //show thong bao loi len man hinh cho user biet
        _showAlert("Validation", "Category icon is required");

        return;
      }

      //mo realm de cbi ghi du lieu
      var config = Configuration.local([CategoryRealmEntity.schema]);
      var realm = Realm(config);

      //luu du lieu vao realm

      final backgroundColorHex = _colorSelected.toHex();
      var category = CategoryRealmEntity(ObjectId(), categoryName,
          iconCodePoint: _iconSelected?.codePoint,
          backgroundColorHex: backgroundColorHex,
          iconColorHex: _iconcolorSelected.toHex());

      await realm.writeAsync(() {
        realm.add(category);
      });

      _nameCategoryTextController.text = "";
      _colorSelected = Color(0xFFC9CC41);
      _iconcolorSelected = Color(0xFF66CC41);
      _iconSelected = null;
      setState(() {});

      //show alert to user
      _showAlert("Succesfully", "Create category success!");
    } catch (e) {
      print(e);
      _showAlert("Failure", "Create category failure!");
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }

  void _chooseIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
        context as BuildContext,
        iconPackModes: [
          IconPack.material,
        ]);
    setState(() {
      _iconSelected = icon;
    });
  }

  void _onChooseCategoryBackgroundColor() async {
    showDialog(
      context: context as BuildContext,
      builder: (context) {
        //cach 1
        // return AlertDialog(
        //   content: SingleChildScrollView(
        //     child: ColorPicker(
        //       pickerColor: _colorSelected,
        //       onColorChanged: (Color newColor) {
        //         setState(() {
        //           _colorSelected = newColor;
        //         });
        //       },
        //     ),
        //   ),
        // );
        //cach 2
        return AlertDialog(
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: _colorSelected,
              enableLabel: true,
              onColorChanged: (Color newColor) {
                setState(() {
                  _colorSelected = newColor;
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  void _onChooseCategoryIconTextColor() async {
    showDialog(
      context: context as BuildContext,
      builder: (context) {
        //cach 1
        return AlertDialog(
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: _iconcolorSelected,
              enableLabel: true,
              onColorChanged: (Color newColor) {
                setState(() {
                  _iconcolorSelected = newColor;
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
        //cach 2
        // return AlertDialog(
        //   content: SingleChildScrollView(
        //     child: MaterialPicker(
        //       pickerColor: _colorSelected,
        //       onColorChanged: (Color newColor) {
        //         setState(() {
        //           _colorSelected = newColor;
        //         });
        //       },
        //     ),
        //   ),
        // );
      },
    );
  }
}
