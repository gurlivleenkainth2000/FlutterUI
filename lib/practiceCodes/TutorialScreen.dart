import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      screenFirst(),
      screenSecond(),
      screenThird(),
      screenFourth(),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: PageView(
                  children: screens,
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                )
            ),
            ScrollingPageIndicator(
              controller: _controller,
              itemCount: screens.length,
              dotSelectedColor: Color(0xFFFF0000),
              dotSelectedSize: 8,
              dotColor: Colors.grey[700],
              dotSize: 6,
              orientation: Axis.horizontal,
              dotSpacing: 12.0,
            )
          ],
        ),
      ),
    );
  }

  Widget screenFirst() {
    return Center(
        child: Text('Screen First', style: Theme.of(context).textTheme.headline1,)
    );
  }

  Widget screenSecond() {
    return Center(
        child: Text('Screen Second', style: Theme.of(context).textTheme.headline1,)
    );
  }

  Widget screenThird() {
    return Center(
        child: Text('Screen Third', style: Theme.of(context).textTheme.headline1,)
    );
  }

  Widget screenFourth() {
    return Center(
        child: Text('Screen Fourth', style: Theme.of(context).textTheme.headline1,)
    );
  }
}
