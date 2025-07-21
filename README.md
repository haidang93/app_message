# 📬 AppMessage

`app_message` is a lightweight, customizable Flutter library that allows you to display animated, dismissible banner messages at the top of your app. It’s ideal for showing alerts, toasts, and app-wide notifications with a clean and consistent design.

---

## ✨ Features

- ✅ Animated top-banner messages
- ✅ Built-in types: `information`, `success`, `caution`, `error`, `custom`
- ✅ Fully customizable styles, widgets, colors, icons, and actions
- ✅ Global API: `showAppMessage` and `clearAppMessage`
- ✅ Swipe to dismiss
- ✅ Easy to integrate with `MaterialApp`

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  app_message: <latest_version>
```

Then run:

```bash
flutter pub get
```

or

```bash
flutter pub add app_message
```

---

## 🧱 Getting Started

### 1. Wrap Your App

To use `AppMessage`, wrap your entire app with it:

```dart
import 'package:app_message/app_message.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMessage(
      child: MaterialApp(
        title: 'App Message Demo',
        home: const MyHomePage(),
      ),
    );
  }
}
```

---

### 2. Show a Message

Use the `showAppMessage` function:

```dart
showAppMessage(
  context: context,
  title: "Hello!",
  message: "This is an informational message.",
  type: AppMessageType.information,
);
```

You can also clear a message manually:

```dart
clearAppMessage(context);
```

---

## 🧪 Example Usage

```dart
OutlinedButton(
  onPressed: () {
    showAppMessage(
      context: context,
      title: "Success",
      message: "Operation completed successfully!",
      type: AppMessageType.success,
    );
  },
  child: Text("Show Success Message"),
);
```

### Built-in types:

| Type          | Usage Example                          |
| ------------- | -------------------------------------- |
| `information` | For general info                       |
| `success`     | Operation completed                    |
| `caution`     | Warning or cautionary notes            |
| `error`       | For error messages                     |
| `custom`      | Fully customizable with your own style |

---

## 🎨 Customization Options

The `showAppMessage()` function accepts several optional parameters:

```dart
showAppMessage(
  context: context,
  title: "Custom Title",
  message: "Custom message body",
  icon: Icon(Icons.star),
  textColor: Colors.black,
  backgroundColor: Colors.yellow.shade100,
  indicatorColor: Colors.amber,
  showDuration: 4,
  animationDuration: Duration(milliseconds: 300),
  padding: EdgeInsets.all(12),
  curve: Curves.easeInOut,
  onTap: (ctx) => print("Message tapped"),
);
```

---

## 🧩 API Reference

### `showAppMessage({ ... })`

| Parameter           | Type                                      | Description                                   |
| ------------------- | ----------------------------------------- | --------------------------------------------- |
| `context`           | `BuildContext` (required)                 | Build context to find the `AppMessage` widget |
| `title`             | `String?`                                 | Optional message title                        |
| `titleWidget`       | `Widget?`                                 | Custom title widget                           |
| `message`           | `String?`                                 | Main message text                             |
| `messageWidget`     | `Widget?`                                 | Custom message widget                         |
| `icon`              | `Widget?`                                 | Optional icon                                 |
| `type`              | `AppMessageType` (default: `information`) | Predefined message type                       |
| `onTap`             | `Function(BuildContext)?`                 | Callback when the message is tapped           |
| `textColor`         | `Color?`                                  | Message text color                            |
| `backgroundColor`   | `Color?`                                  | Background color of the message box           |
| `indicatorColor`    | `Color?`                                  | Color of the left indicator stripe            |
| `showDuration`      | `int` (seconds)                           | Duration the message stays on screen          |
| `animationDuration` | `Duration`                                | Entry/exit animation duration                 |
| `padding`           | `EdgeInsetsGeometry?`                     | Internal padding                              |
| `curve`             | `Curve`                                   | Animation curve                               |

---

## 📄 License

MIT License © NGUYEN HAI DANG

---

## 💡 Tip

Call `AppMessage.of(context)?.controller` directly if you need fine-grained control, such as persistent messages, or want to implement your own advanced display logic.

---
