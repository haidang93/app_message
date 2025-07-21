import 'package:flutter/material.dart';
import 'package:app_message/app_message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMessage(
      child: MaterialApp(title: 'App Message Demo', home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showInformationMessage() {
    showAppMessage(
      context: context,
      title: "Message",
      message: "Information",
      type: AppMessageType.information,
    );
  }

  void showSuccessMessage() {
    showAppMessage(
      context: context,
      title: "Message",
      message: "Success",
      type: AppMessageType.success,
    );
  }

  void showCautionMessage() {
    showAppMessage(
      context: context,
      title: "Message",
      message: "Caution",
      type: AppMessageType.caution,
    );
  }

  void showErrorMessage() {
    showAppMessage(
      context: context,
      title: "Message",
      message: "Error",
      type: AppMessageType.error,
    );
  }

  void showCustomMessage() {
    showAppMessage(
      context: context,
      title: "Message",
      message: "Custom",
      type: AppMessageType.custom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("App Message Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: <Widget>[
              OutlinedButton(
                onPressed: showInformationMessage,
                child: Text("Show Information Message"),
              ),
              OutlinedButton(
                onPressed: showSuccessMessage,
                child: Text("Show Successful Message"),
              ),
              OutlinedButton(
                onPressed: showCautionMessage,
                child: Text("Show Caution Message"),
              ),
              OutlinedButton(
                onPressed: showErrorMessage,
                child: Text("Show Error Message"),
              ),
              OutlinedButton(
                onPressed: showCustomMessage,
                child: Text("Show Custom Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
