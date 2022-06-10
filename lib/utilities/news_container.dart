import 'package:flutter/material.dart';
import 'package:uplabs/services/date.dart';
import 'package:uplabs/utilities/constants.dart';
import 'package:uplabs/utilities/news_text_button.dart';

class NewsContainer extends StatelessWidget {
  final Color backgroundColour;
  final String newsDescription;
  final String textButtonTitle;
  final void Function() onSelection;
  const NewsContainer({
    Key? key,
    required this.newsDescription,
    required this.textButtonTitle,
    required this.backgroundColour,
    required this.onSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Date date = Date();
    String currentDate = date.printDate();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onSelection,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Text('Some text here'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        top: 9.0,
                        right: 20.0,
                        bottom: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NewsTextButton(
                                buttonTitle: textButtonTitle,
                                colour: backgroundColour,
                              ),
                              SizedBox(
                                child: Text(currentDate),
                              )
                            ],
                          ),
                          Text(
                            newsDescription,
                            style: kNewsContainerTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
