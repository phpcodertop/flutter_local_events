import 'package:flutter/material.dart';
import 'package:local_events/app_state.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/ui/event_details/event_details.dart';
import 'package:local_events/ui/homepage/event_widget.dart';
import 'package:provider/provider.dart';
import '../../model/category.dart';
import '../../styles.dart';
import 'category_widget.dart';
import 'homepage_background.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomepageBackground(
              screenHeight: screenHeight,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 32, right: 32, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'LOCAL EVENTS',
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Text(
                        'What\'s Up',
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 24, bottom: 24),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final category in categories)
                                CategoryWidget(category: category),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: [
                            for (final event in events.where(
                              (e) => e.categoryIds
                                  .contains(appState.selectedCategoryId),
                            ))
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          EventDetails(event: event),
                                    ),
                                  );
                                },
                                child: EventWidget(
                                  event: event,
                                ),
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
      ),
    );
  }
}
