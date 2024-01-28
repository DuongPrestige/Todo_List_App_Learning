import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TaskPriorityListPage extends StatefulWidget {
  const TaskPriorityListPage({super.key});

  @override
  State<TaskPriorityListPage> createState() => _TaskPriorityListPageState();
}

class _TaskPriorityListPageState extends State<TaskPriorityListPage> {
  List<int> priorityListDataSource = [];
  int? _selectPriority;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        priorityListDataSource = List.generate(10, (index) => index + 1);
      });
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
            _buildChoosePriorityTitle(),
            _buildGridPriorityList(),
            _buildCreatePriorityButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildChoosePriorityTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Task Priority",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.87),
            )),
        Divider(
          color: Color(0xFF979797),
        )
      ],
    );
  }

  Widget _buildGridPriorityList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final priority = priorityListDataSource.elementAt(index);
        return _buildGridPriorityItem(priority);
      },
      itemCount: priorityListDataSource.length,
    );
  }

  Widget _buildGridPriorityItem(int priority) {
    final isSelected = priority == _selectPriority;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectPriority = priority;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isSelected ? const Color(0xFF8687E7) : const Color(0xFF272727),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/flag.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              Text(
                priority.toString(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreatePriorityButton() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107, bottom: 24),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
              Navigator.pop(context, {"priority": _selectPriority});
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8875FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            child: Text(
              "Save",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.44),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future<void> _getCategoryList() async {
  //   final config = Configuration.local([CategoryRealmEntity.schema]);
  //   final realm = Realm(config);
  //
  //   final categories = realm.all<CategoryRealmEntity>();
  //   List<CategoryModel> categoryModels = categories.map((e) {
  //     return CategoryModel(
  //       id: e.id.hexString,
  //       name: e.name,
  //       iconCodePoint: e.iconCodePoint,
  //       backgroundColorHex: e.backgroundColorHex,
  //       iconColorHex: e.iconColorHex,
  //     );
  //   }).toList();
  //   setState(() {
  //     categoryListDataSource = categoryModels;
  //   });
  // }

  // void _gotoCreateCategoryPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => CreateOrEditCategory()),
  //   );
  // }

  // void _onHandleClickCategoryItem(CategoryModel category) {
  //   if (_isEditMode) {
  //     //Di den man hinh edit
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => CreateOrEditCategory(
  //                 categoryId: category.id,
  //               )),
  //     );
  //   } else {
  //     Navigator.pop(context, {
  //       "categoryId": category.id,
  //       "name": category.name,
  //       "iconCodePoint": category.iconCodePoint,
  //       "backgroundColorHex": category.backgroundColorHex,
  //       "iconColorHex": category.iconColorHex,
  //     });
  //   }
  // }
}
