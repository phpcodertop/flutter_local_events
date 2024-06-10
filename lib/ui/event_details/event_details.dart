import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:provider/provider.dart';

import 'event_detail_background.dart';
import 'event_detail_content.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  const EventDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: const Stack(
          children: [
            EventDetailBackground(),
            EventDetailContent(),
          ],
        ),
      ),
    );
  }
}
