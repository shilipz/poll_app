import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_app/core/common/widgets/loader.dart';
import 'package:poll_app/core/theme/app_palette.dart';
import 'package:poll_app/core/utils/show_snackbar.dart';
import 'package:poll_app/features/new_poll/presentation/bloc/newpoll_bloc.dart';
import 'package:poll_app/main.dart';
import 'package:poll_app/features/new_poll/presentation/widgets/new_poll_widget.dart';

class NewPollPage extends StatefulWidget {
  const NewPollPage({
    super.key,
  });

  @override
  State<NewPollPage> createState() => _NewPollState();
}

class _NewPollState extends State<NewPollPage> {
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController statementController = TextEditingController();

  @override
  void dispose() {
    topicController.dispose();
    statementController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moderators Poll', style: AppPalette.appbarText),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppPalette.gradient1, AppPalette.gradient2])),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8, bottom: 20),
          child: SingleChildScrollView(
            child: BlocConsumer<NewpollBloc, NewpollState>(
              listener: (context, state) {
                if (state is NewpollFailure) {
                  showSnackBar(context, state.failMessage);
                }
              },
              builder: (context, state) {
                if (state is NewpollLoading) {
                  const Loader();
                }
                return Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.04),
                        child: Center(
                            child: Text('Create Poll',
                                style: AppPalette.crPollText))),
                    SizedBox(height: screenHeight * 0.06),
                    AddTextContainers(
                        heading: 'TOPIC', inputController: topicController),
                    SizedBox(height: screenHeight * 0.04),
                    AddTextContainers(
                        heading: 'Statement',
                        inputController: statementController),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.fromBorderSide(
                            BorderSide(color: AppPalette.transGrey)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ChoiceTiles(heading: 'MCQ'),
                                ChoiceTiles(heading: 'Picture'),
                                ChoiceTiles(heading: 'Rate It'),
                              ]),
                          const SizedBox(height: 20),
                          PollOptions(
                            hintText: 'Option1',
                            inputController: option1Controller,
                          ),
                          PollOptions(
                            hintText: 'Option2',
                            inputController: option2Controller,
                          ),
                          PollOptions(
                            hintText: 'Option3',
                            inputController: option3Controller,
                          ),
                          PollOptions(
                            hintText: 'Option4',
                            inputController: option4Controller,
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppPalette.buttonColor,
                          borderRadius: BorderRadius.circular(12)),
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          String option1 = option1Controller.text.trim();
                          String option2 = option2Controller.text.trim();
                          String option3 = option3Controller.text.trim();
                          String option4 = option4Controller.text.trim();

                          int filledOptionsCount = 0;
                          if (option1.isNotEmpty) filledOptionsCount++;
                          if (option2.isNotEmpty) filledOptionsCount++;
                          if (option3.isNotEmpty) filledOptionsCount++;
                          if (option4.isNotEmpty) filledOptionsCount++;

                          if (filledOptionsCount < 2) {
                            showSnackBar(
                                context, 'Fill  atleast 2 options to vote');
                          } else {
                            List<String> options = [
                              option1,
                              option2,
                              option3,
                              option4
                            ].where((option) => option.isNotEmpty).toList();

                            context.read<NewpollBloc>().add(PostNewPoll(
                                topicController.text.trim(),
                                statementController.text.trim(),
                                'text',
                                options));
                          }
                        },
                        child: Text('Submit',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
