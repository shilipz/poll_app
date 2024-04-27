import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_app/core/theme/app_palette.dart';
import 'package:poll_app/main.dart';

class AddTextContainers extends StatelessWidget {
  final String heading;
  final TextEditingController? inputController;
  const AddTextContainers(
      {super.key, required this.heading, this.inputController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            heading,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppPalette.kGrey,
            )),
          ),
        ),
        const SizedBox(height: 12),
        Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(
                BorderSide(color: AppPalette.transGrey),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextFormField(
                controller: inputController,
                decoration: const InputDecoration(
                    hintText: 'write here...',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                    border: InputBorder.none),
              ),
            )),
      ],
    );
  }
}

class ChoiceTiles extends StatefulWidget {
  final String heading;
  const ChoiceTiles({
    required this.heading,
    super.key,
  });

  @override
  State<ChoiceTiles> createState() => _ChoiceTilesState();
}

class _ChoiceTilesState extends State<ChoiceTiles> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    return Container(
      decoration: AppPalette.containerBorder,
      height: 90,
      width: 85,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: widget.heading),
                    const TextSpan(
                      text: '\nPoll',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppPalette.kGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Radio(
                value: true,
                groupValue: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value as bool;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PollOptions extends StatelessWidget {
  final TextEditingController? inputController;

  final String hintText;
  const PollOptions({
    required this.hintText,
    super.key,
    this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: inputController,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
              onPressed: () {
                inputController!.clear();
              },
              icon: const Icon(Icons.close)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
