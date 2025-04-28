import 'package:bloc_todo/components/custom.datetime.picker.dart';
import 'package:bloc_todo/components/custom.input.dart';
import 'package:bloc_todo/components/custom.time.picker.dart';
import 'package:bloc_todo/components/primary.button.dart';
import 'package:bloc_todo/theme/app.colors.dart';
import 'package:bloc_todo/views/app.view.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return AppView(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                title: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: const Text(
                          "Create Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomInput(label: "Title", hintText: "Enter task title"),
                      SizedBox(height: 20),
                      CustomInput(
                        label: "Description",
                        hintText: "Enter description here",
                        minLines: 2,
                      ),
                      SizedBox(height: 20),
                      //Row of date and time pickers, using date picker and time picker
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              label: "Date",
                              suffixIcon: Icon(Icons.calendar_month),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomTimePicker(
                              label: "Time",
                              hintText: "Select time",
                              suffixIcon: Icon(Icons.access_time),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      PrimaryButton(
                        title: "Create Task",
                        onPressed: () {
                          print("Task Created");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
