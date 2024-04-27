// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poll_app/core/theme/app_palette.dart';
import 'package:poll_app/main.dart';

class PollGrids extends StatefulWidget {
  final int? noOfLikes;
  final List<dynamic>? comments;
  final String? id;
  final String topic;
  final String statement;
  final List<String>? textOptions;
  const PollGrids({
    super.key,
    this.comments,
    required this.id,
    required this.topic,
    required this.statement,
    required this.textOptions,
    required this.noOfLikes,
  });

  @override
  State<PollGrids> createState() => _PollGridsState();
}

class _PollGridsState extends State<PollGrids> {
  late List<PollOption> pollOptions;

  @override
  void initState() {
    super.initState();
    if (widget.textOptions == null || widget.textOptions!.length < 2) {
      pollOptions = [
        PollOption(id: '1', title: const Text(''), votes: 0),
        PollOption(id: '2', title: const Text(''), votes: 0),
      ];
    } else {
      pollOptions = widget.textOptions!.map((option) {
        return PollOption(id: option, title: Text(option), votes: 0);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppPalette.gradient1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                widget.topic,
                textAlign: TextAlign.center,
                style: GoogleFonts.odorMeanChey(
                  textStyle: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                widget.statement,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FlutterPolls(
                pollOptionsHeight: screenHeight * 0.07,
                votedBackgroundColor: Colors.black,
                loadingWidget: const LinearProgressIndicator(),
                leadingVotedProgessColor: AppPalette.transOrange,
                pollId: widget.id,
                onVoted: defaultOnVotedFunction,
                pollTitle: RichText(
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppPalette.gradient1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Follow '),
                      TextSpan(
                        text: '@ TOI |',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.kGrey,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' Today',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppPalette.kGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pollOptions: pollOptions,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.message_outlined,
                    color: AppPalette.gradient1,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "${widget.statement.length.toString()} comments",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppPalette.gradient1,
                            fontSize: 12,
                            fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.near_me_outlined,
                    color: AppPalette.gradient1,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "share",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppPalette.gradient1,
                            fontSize: 12,
                            fontWeight: FontWeight.w100)),
                  )
                ],
              ),
              const Divider(color: AppPalette.gradient1, thickness: 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.account_circle),
                      const SizedBox(width: 6),
                      Text('Times of India ',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500))),
                      Text('(TOI)',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Us intel ... comments...',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500))),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 18,
                                )),
                            Text('2.1 k',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> defaultOnVotedFunction(PollOption option, int value) async {
    // Perform some default action when user votes
    // For example, you can return true to indicate that the vote was successful
    return true;
  }
}
