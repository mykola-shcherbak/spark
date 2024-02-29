import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_test/api/task_api.dart';
import 'package:spark_test/bloc/tasks_list_cubit.dart';
import 'package:spark_test/constants/color_constants.dart';
import 'package:spark_test/constants/text_constants.dart';
import 'package:spark_test/screens/process_screen.dart';
import 'package:spark_test/utils/link_validation_utills.dart';
import 'package:spark_test/widgets.dart/custom_app_bar.dart';
import 'package:spark_test/widgets.dart/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String path = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final linkController = TextEditingController();
  bool isError = false;

  @override
  void initState() {
    super.initState();
    linkController.text = TaskApiClient.getRequestUrl;
  }

  @override
  void dispose() {
    linkController.dispose();
    super.dispose();
  }

  void onPressed() {
    final isValid = validateLink(linkController.text);
    if (isValid) {
      context.read<TasksListCubit>().getTasks(linkController.text);
      context.push(ProcessScreen.path);
    } else {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, TextConstants.homeScreen, null),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<TasksListCubit, TasksListState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TextConstants.setUrl),
                    TextField(
                      controller: linkController,
                      onChanged: (value) {
                        setState(() {
                          isError = false;
                        });
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIconConstraints:
                            BoxConstraints.tight(const Size(25, 30)),
                        prefixIcon: Icon(
                          Icons.link,
                          color: isError
                              ? ColorConstants.error
                              : ColorConstants.accentColor,
                          size: 20,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorConstants.accentColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorConstants.accentColor),
                        ),
                        errorText: isError ? TextConstants.linkError : null,
                      ),
                      cursorColor: ColorConstants.accentColor,
                    ),
                  ],
                ),
                customButton(TextConstants.startProcess, onPressed)
              ],
            );
          },
        ),
      ),
    );
  }
}
