import 'package:earpy_app/controllers/notecontroller.dart';
import 'package:earpy_app/presentations/components/Button/circleiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> privateForm = GlobalKey<FormState>();

    return Scaffold(
      body: _buildBody(privateForm),
    );
  }

  Widget _buildBody(GlobalKey<FormState> privateForm) {
    return SingleChildScrollView(
      child: Container(
        decoration: _buildDecoration(),
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 20),
            _buildContent(privateForm),
          ],
        ),
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
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContent(GlobalKey<FormState> privateForm) {
    return SizedBox(
      child: Container(
        decoration: _buildContentDecoration(),
        child: Column(
          children: [
            _buildHeader(),
            _buildForm(privateForm),
          ],
        ),
      ),
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

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleIconButton(
            icon: Icons.arrow_back,
            onTap: () => controller.gotoDailyJournal(),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(GlobalKey<FormState> privateForm) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
        key: privateForm,
        child: Column(
          children: [
            _buildTitleField(),
            const SizedBox(height: 10),
            _buildContentField(),
            _buildSaveButton(privateForm),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: controller.title,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Title is required';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildContentField() {
    return TextFormField(
      controller: controller.content,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: 'Typing here...',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      maxLines: Get.height ~/ 50,
    );
  }

  Widget _buildSaveButton(GlobalKey<FormState> privateForm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: CircleIconButton(
            icon: Icons.save,
            sizeIcon: 30,
            onTap: () {
              if (privateForm.currentState!.validate()) {
                if (controller.statusNote.value) {
                  controller.updateNotes();
                } else {
                  controller.addNotes();
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
