import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: storyPage(),
    );
  }
}

Storybrain object1 = Storybrain();

class storyPage extends StatefulWidget {
  const storyPage({Key? key}) : super(key: key);

  @override
  _storyPageState createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    object1.getStory(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        object1.nextStory(1);
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      object1.getChoice1(),
                      style: TextStyle(fontSize: 20.0),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: object1.buttonShouldBeVisible(),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          object1.nextStory(2);
                        });
                      },
                      color: Colors.green,
                      child: Text(
                        object1.getChoice2(),
                        style: TextStyle(fontSize: 20.0),
                      )),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
