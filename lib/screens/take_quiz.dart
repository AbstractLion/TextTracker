import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:login_example/widgets/text_tracker_app_bar.dart';

class TakeQuiz extends StatelessWidget {
  static const String routeName = '/takequiz';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TextTrackerAppBar(page: 5),
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 3),
              Text("Before you begin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Spacer(),
              Text(
                  "This quiz must be completed in one session; make sure you have a stable internet connection & you’re finished before exiting.",
                   style: TextStyle(fontSize: 15)),
              Spacer(),
              Chip(
                avatar: Icon(
                  Icons.access_alarm,
                ),
                label: Text("~10 minutes to complete"),
              ),
              Chip(
                avatar: Icon(
                  Icons.playlist_add_check,
                ),
                label: Text("70th percentile required to pass"),
              ),
              Chip(
                avatar: Icon(
                  Icons.calendar_today,
                ),
                label: Text("Retry in 30 days if you fail"),
              ),
              Spacer(),
              GFButton(
                onPressed: () => print("Hi"),
                color: Colors.black87,
                child: Text("Begin"),
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}