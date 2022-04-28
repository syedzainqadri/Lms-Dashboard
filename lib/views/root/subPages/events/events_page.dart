import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/events/widgets/event_table.dart';
import 'addEvent/add_event_dialog.dart';
import 'widgets/add_button.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

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
                textStyle6("Programs", TextAlign.left, ColorManager.darkColor),
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
                    child:
                        addButton("Add Program", width > 800 ? false : true)),
              ],
            ),
            const EventsTable(),
          ],
        ),
      ),
    );
  }
}
