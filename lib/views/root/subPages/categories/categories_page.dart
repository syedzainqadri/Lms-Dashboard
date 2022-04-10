import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/widgets/add_button.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/widgets/categories_table.dart';
import 'addCategory/add_event_dialog.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle6("Events", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddEventDialog();
                        },
                      );
                    },
                    child: addButton("Add Events", width > 800 ? false : true)),
              ],
            ),
            const CategoriesTable(),
          ],
        ),
      ),
    );
  }
}
// Get.toNamed('/addCat');