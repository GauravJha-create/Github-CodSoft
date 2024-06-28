import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Quotes',
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(backgroundColor: Colors.green)),
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<String> quotes = [
    "The best way to predict the future is to invent it.",
    "Life is 10% what happens to us and 90% how we react to it.",
    "The only limit to our realization of tomorrow is our doubts of today.",
    "The purpose of our lives is to be happy.",
    "Get busy living or get busy dying."
  ];

  String currentQuote = "Loading...";
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    loadQuote();
  }

  void loadQuote() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      currentQuote = prefs?.getString('quote') ?? quotes.first;
    });
  }

  void saveQuote(String quote) async {
    await prefs?.setString('quote', quote);
  }

  void refreshQuote() {
    setState(() {
      currentQuote = (quotes..shuffle()).first;
      saveQuote(currentQuote);
    });
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Quotes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuote,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: refreshQuote,
                    child: Text('New Quote'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: shareQuote,
                    child: Text('Share'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
