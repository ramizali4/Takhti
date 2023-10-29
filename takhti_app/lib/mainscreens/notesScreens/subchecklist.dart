import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';
import '../../theme/text_theme.dart';

class ChecklistItem {
  bool isChecked;
  String text;
  List<SubChecklistItem> subChecklistItems;
  ChecklistItem({required this.isChecked, required this.text, this.subChecklistItems = const []});
}
class SubChecklistItem {
  bool isChecked;
  String text;
  SubChecklistItem({required this.isChecked, required this.text});
}

class DynamicSubChecklist extends StatefulWidget {
  const DynamicSubChecklist({Key? key}) : super(key: key);
  @override
  State<DynamicSubChecklist> createState() => _DynamicSubChecklistState();
}

class _DynamicSubChecklistState extends State<DynamicSubChecklist> {
  List<ChecklistItem> _checklistItems = [];
  void _addChecklistItem() {
    setState(() {
      _checklistItems.add(ChecklistItem(isChecked: false, text: ''));
    });
  }

  void _addSubChecklistItem(ChecklistItem checklistItem) {
    setState(() {
      checklistItem.subChecklistItems = List.from(checklistItem.subChecklistItems)
        ..add(SubChecklistItem(isChecked: false, text: ''));
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
    CustomTextTheme tt = CustomTextTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
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
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Column(
            children: [
              for (final subChecklistItem in checklistItem.subChecklistItems)
                _buildSubChecklistItem(subChecklistItem),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SizedBox(
            width: 170,
            child: TextButton(
              onPressed:() => _addSubChecklistItem(checklistItem),
              child:  Row(
                children: [
                  const Icon(Icons.add,color: AppColorsDark.primaryBlack,),
                  Text('Add Sub-Item',style: tt.underlinedSmall,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubChecklistItem(SubChecklistItem subChecklistItem) {
    CustomTextTheme tt = CustomTextTheme();
    return Row(
      children: [
        Checkbox(
          value: subChecklistItem.isChecked,
          onChanged: (value) {
            setState(() {
              subChecklistItem.isChecked = value!;
            });
          },
        ),
        Expanded(
          child: TextField(
            style: tt.bodyNormal,
            decoration: InputDecoration(
              hintText: 'Enter sub-checklist item text...',
              hintStyle: tt.subtitle2,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                subChecklistItem.text = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
