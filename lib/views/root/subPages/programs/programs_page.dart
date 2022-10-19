import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import '../../../../controllers/title_controller.dart';
import 'addProgram/add_program_dialog.dart';
import 'widgets/add_program_button.dart';
import 'widgets/program_table.dart';
import 'package:get/get.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({Key? key}) : super(key: key);

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  final TitleController titleController = Get.put(TitleController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.changeName("Programs List");
    });
  }

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
                          return const AddProgramDialog();
                        },
                      );
                    },
                    child: addProgramButton(
                        "Add Program", width > 800 ? false : true)),
              ],
            ),
            const ProgramsTable(),
          ],
        ),
      ),
    );
  }
}
