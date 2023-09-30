import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/ui/widgets/custom_text_field.dart';
import 'package:retail_app/src/utils/extenstions.dart';
import 'package:retail_app/src/utils/utils.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> _categoryList = [];
  int index = 1;
  List<DataColumn> listOfColumns = const [
    DataColumn(label: Text("#")),
    DataColumn(label: Text("Name")),
    DataColumn(label: Text("Status")),
    DataColumn(label: Text("Action")),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Categories", style: TextStyle(fontSize: 15)),
            const Spacer(),
            TextButton(
              onPressed: () => _showAddUpdateDialog(),
              child: const Text("Add Category"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: context.categoryStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            index = 1;
            _categoryList = snapshot.data != null ? snapshot.data! : [];

            return Expanded(
              child: InteractiveViewer(
                // constrained: false,
                child: DataTable(
                  dataRowColor:
                      MaterialStateProperty.resolveWith(_getDataRowColor),
                  dividerThickness: 1,
                  showCheckboxColumn: false,
                  showBottomBorder: true,
                  columns: listOfColumns,
                  rows: _categoryList
                      .map<DataRow>(
                        (e) => _getRow(index++, e),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  DataRow _getRow(int index, Category category) {
    List<DataCell> listOfCells = [
      DataCell(Text(index.toString())),
      DataCell(Text(category.name)),
      DataCell(
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: category.status
                  ? Colors.green.withOpacity(0.5)
                  : Colors.red.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(
              category.status ? 'Active' : 'Inactive',
              style: TextStyle(
                color: category.status ? Colors.green : Colors.red,
              ),
            ),
          ),
        ),
      ),
    ];

    //Actions
    listOfCells.add(DataCell(
      Row(
        children: [
          FilledButton(
            onPressed: () => _showAddUpdateDialog(category: category),
            child: const Icon(Icons.update),
          ),
        ],
      ),
    ));
    return DataRow(
      cells: listOfCells,
      onSelectChanged: (isSelected) => {},
    );
  }

  Color? _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return const Color(0xFF171B2D);
    }

    return null;
  }

  Future<void> _showAddUpdateDialog({Category? category}) async {
    bool isUpdate = category != null;

    final formKey = GlobalKey<FormState>();
    TextEditingController nameController =
        TextEditingController(text: category?.name);
    TextEditingController descriptionController =
        TextEditingController(text: category?.description);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${isUpdate ? "Update" : "Add"} Category"),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CustomTextField(
                    label: "Name",
                    controller: nameController,
                    required: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    label: "Description",
                    controller: descriptionController,
                    lines: 3,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(isUpdate ? 'Update' : 'Add'),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  if (isUpdate) {
                    category!.name = nameController.text;
                    category!.description = descriptionController.text;
                    category!.updatedAt = DateTime.now();
                    context.updateCategory(category!).then((value) {
                      Navigator.of(context).pop(value);
                    }).catchError((err) {
                      if (err.toString().contains("Unique")) {
                        showAlertDialog(
                          context,
                          title: "Error",
                          message: "Category already exist",
                        );
                      }
                    });
                  } else {
                    category = Category(
                      id: ObjectId().hexString,
                      name: nameController.text,
                      description: descriptionController.text,
                      status: true,
                      createdAt: DateTime.now(),
                    );
                    context.addCategory(category!).then((value) {
                      Navigator.of(context).pop(value);
                    }).catchError((err) {
                      if (err.toString().contains("Unique")) {
                        showAlertDialog(
                          context,
                          title: "Error",
                          message: "Category already exist",
                        );
                      }
                    });
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
