import 'package:flutter/material.dart';
import 'package:takhti_app/theme/color_theme.dart';
import '../../theme/text_theme.dart';

class DynamicChecklist extends StatefulWidget {
  const DynamicChecklist({Key? key}) : super(key: key);
  @override
  State<DynamicChecklist> createState() => _DynamicChecklistState();
}

class ChecklistItem {
  bool isChecked;
  String text;
  ChecklistItem({required this.isChecked, required this.text});
}

class _DynamicChecklistState extends State<DynamicChecklist> {
  List<ChecklistItem> _checklistItems = [];

  void _addChecklistItem() {
    setState(() {
      _checklistItems.add(ChecklistItem(isChecked: false, text: ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    CustomTextTheme tt = CustomTextTheme();
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Row(
            children: [
              IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: AppColorsDark.primaryBlack,)),
              Container(
                width: MediaQuery.of(context).size.width-80,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: tt.titleLarge,
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: tt.titleLarge,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
            Divider(
              height: 30,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.grey.shade300,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        for (final checklistItem in _checklistItems)
                          _buildChecklistItem(checklistItem),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 125,
                    child: TextButton(
                      onPressed: _addChecklistItem,
                      child:  Row(
                        children: [
                          const Icon(Icons.add,color: AppColorsDark.primaryBlack,),
                          Text('Add Item',style: tt.underlined,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(ChecklistItem checklistItem) {
    final tt = CustomTextTheme();
    return Row(
      children: [
        Checkbox(
          value: checklistItem.isChecked,
          onChanged: (value) {
            setState(() {
              checklistItem.isChecked = value!;
            });
          },
        ),
        Expanded(
          child: TextField(
            style: tt.bodyNormal,
            decoration: InputDecoration(
              hintText: 'Enter checklist item text...',
              hintStyle: tt.subtitle2,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                checklistItem.text = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
