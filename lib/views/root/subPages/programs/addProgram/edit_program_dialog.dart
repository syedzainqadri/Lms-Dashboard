import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmsadminpanle/controllers/program/get_programs_controller.dart';
import 'package:lmsadminpanle/controllers/program/update_program_controller.dart';
import 'package:lmsadminpanle/models/program_button_model.dart';
import 'package:lmsadminpanle/models/program_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditProgramDialog extends StatefulWidget {
  final String id;
  const EditProgramDialog({Key? key, required this.id}) : super(key: key);

  @override
  _EditProgramDialogState createState() => _EditProgramDialogState();
}

class _EditProgramDialogState extends State<EditProgramDialog> {
  final _programNameController = TextEditingController();
  final _programUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String url = '';
  bool status = false;
  bool isFeatured = false;
  final GetProgramController _programController = Get.put(GetProgramController());
  final UpdateProgramController _updateProgramController = Get.put(UpdateProgramController());
  ProgramModel? programModel;
  XFile? image, photo;
  String? imageUrl;
  File? file;
  final ImagePicker _picker = ImagePicker();
  List programButtonModel = [];
  List<ProgramButtonModel> buttonModel = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    programModel = await _programController.getProgramData(widget.id);
    setState(() {
      _programNameController.text = programModel!.name!;
      _programUrlController.text = programModel!.programUrl!;
      _descriptionController.text = programModel!.description!;
      url = programModel!.url!;
      status = programModel!.status!;
      isFeatured = programModel!.isFeatured!;
      programButtonModel = programModel!.buttonList!;
    });

    for(int i=0; i<programButtonModel.length; i++){
      buttonModel.add(ProgramButtonModel(buttonName: programButtonModel[i]['buttonName'], buttonUrl: programButtonModel[i]['buttonUrl']));
    }

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: size.height * 0.80,
        width: size.width * 0.7,
        child: Obx(() {
          return _programController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSpaceVertical(2.h),
                  Center(
                      child: textStyle4("Edit Program", TextAlign.center, ColorManager.darkColor)),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _programNameController,
                    hintName: StringsManager.event,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _programUrlController,
                    hintName: StringsManager.eventUrl,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _descriptionController,
                    hintName: StringsManager.eventDesc,
                    inputLines: 4,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textStyle3(StringsManager.status, TextAlign.center, ColorManager.darkColor),
                        ToggleSwitch(
                          customWidths: const [50.0, 50.0],
                          cornerRadius: 20.0,
                          initialLabelIndex: status ? 0 : 1,
                          activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['YES', 'NO'],
                          onToggle: (index) {
                            if(index == 0){
                              status = true;
                            }else{
                              status = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textStyle3(StringsManager.tarana, TextAlign.center, ColorManager.darkColor),
                        ToggleSwitch(
                          customWidths: const [50.0, 50.0],
                          cornerRadius: 20.0,
                          initialLabelIndex: isFeatured ? 0 : 1,
                          activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['YES', 'NO'],
                          onToggle: (index) {
                            if(index == 0){
                              isFeatured = true;
                            }else{
                              isFeatured = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  buildSpaceVertical(2.h),
                  Column(
                    children: [
                      Image.network(url, height: 200, width: 250),
                      buildSpaceVertical(3.h),
                      InkWell(
                        onTap: () => getImage(),
                        child: Center(
                          child: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.darkColor,
                            ),
                            child: Center(
                                child: textStyle2("Update Image", TextAlign.center,
                                    ColorManager.whiteColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
                    child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 600,
                      border: TableBorder.all(
                          width: 1.0, color: ColorManager.darkColor),
                      columns: [
                        DataColumn2(
                          label:  Center(
                              child: textStyle2(
                                  "Button Name",
                                  TextAlign.center,
                                  ColorManager.blackColor)),
                        ),
                        DataColumn(
                            label:  Center(
                                child: textStyle2(
                                    "Button Url",
                                    TextAlign.center,
                                    ColorManager.blackColor))),
                        DataColumn(
                          label:Center(
                              child: textStyle2(
                                  "Action",
                                  TextAlign.right,
                                  ColorManager.blackColor)),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        programButtonModel.length,
                            (index) => DataRow(cells: [
                          DataCell(textStyle0_5("${programButtonModel[index]['buttonName']}", TextAlign.left, ColorManager.blackColor)),
                          DataCell( textStyle0_5(programButtonModel[index]['buttonUrl']!, TextAlign.center, ColorManager.blackColor)),
                          DataCell(IconButton(
                            icon: const Icon(Icons.delete),
                            color: ColorManager.redColor,
                            iconSize: 24,
                            onPressed: () {
                              programButtonModel.removeAt(index);
                              setState(() {  });
                            },
                          )),
                        ]),
                      ),
                    ),
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 2),
                    child: const Divider(
                        height: 1, thickness: 1, color: ColorManager.darkColor),
                  ),
                  buildSpaceVertical(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () async {
                            _updateProgramController.updateProgram(
                                widget.id,
                                _programNameController.text, imageUrl,
                                _programUrlController.text,  _descriptionController.text,status, isFeatured, buttonModel);
                            Get.offAllNamed('/root');
                          },
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.darkColor,
                            ),
                            child: Obx(() {
                              return _updateProgramController.isUpdatingProgram.isTrue ? const Center(child: CircularProgressIndicator()):
                              Center(
                                child: textStyle3("UPDATE", TextAlign.center,
                                    ColorManager.whiteColor),
                              );
                            })
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.redColor,
                            ),
                            child: Center(
                              child: textStyle3("CANCEL", TextAlign.center,
                                  ColorManager.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                  buildSpaceVertical(1.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  getImage() async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    PickedFile? pickedFile;
    if (photo != null) {
      image = photo;
      file = File(image!.path);
      pickedFile = PickedFile(file!.path);
      await uploadImageToStorage(pickedFile);
    }
  }

  uploadImageToStorage(PickedFile? pickedFile) async {
    DateTime dateTime = DateTime.now();
    Reference reference = FirebaseStorage.instance.ref().child("eventImage/$dateTime");
    await reference.putData(await pickedFile!.readAsBytes(), SettableMetadata(contentType: 'image/jpeg'));
    imageUrl = await reference.getDownloadURL();
    print(imageUrl);
    setState(() {});
  }

}
