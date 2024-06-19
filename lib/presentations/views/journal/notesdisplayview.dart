import 'package:earpy_app/controllers/notesdisplaycontroller.dart';
import 'package:earpy_app/presentations/components/Button/circleiconbutton.dart';
import 'package:earpy_app/presentations/components/Decoration/buttomsheetdelete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesDisplayView extends GetView<NotesDisplayController> {
  const NotesDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      decoration: _buildDecoration(),
      child: Column(
        children: [
          _buildTitle(),
          _buildContentContainer(),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.pinkAccent, Colors.purpleAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: const Text(
        'Notes',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContentContainer() {
    return Container(
      decoration: _buildContentDecoration(),
      child: _buildContent(),
    );
  }

  BoxDecoration _buildContentDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildNotesContent(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return CircleIconButton(
      icon: Icons.arrow_back,
      onTap: controller.gotoDailyJournal,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        _buildDeleteButton(),
        const SizedBox(width: 10),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return CircleIconInvertButton(
      icon: Icons.delete_outline_outlined,
      onTap: _openButtomSheet,
    );
  }

  void _openButtomSheet() {
    controller.openButtomSheet(
      ButtomSheetDelete(
        onDelete: () => controller.gotoAccpeteDelete(controller.idNote.value),
        onCancel: () => controller.gotoCancelDelete,
      ),
    );
  }

  Widget _buildEditButton() {
    return CircleIconButton(
      icon: Icons.edit_document,
      onTap: controller.updateNotesContent,
    );
  }

  Widget _buildNotesContent() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: _buildNotesDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText(),
          _buildDivider(),
          _buildContentText(),
        ],
      ),
    );
  }

  BoxDecoration _buildNotesDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.pinkAccent),
    );
  }

  Widget _buildTitleText() {
    return Obx(() {
      return Text(
        controller.title.value,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      );
    });
  }

  Widget _buildDivider() {
    return Container(
      width: Get.width,
      height: 2,
      color: Colors.pinkAccent,
    );
  }

  Widget _buildContentText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Obx(() {
        return Text(
          controller.content.value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        );
      }),
    );
  }
}
