# Flutter Spannable String
A Flutter package for parsing and displaying spannable strings with various styling options, including text color, background color, text size, text decoration (underline, strikethrough), font style (italic) and font weight (bold).

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/arsybai/flutter-spannable-string)


## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_spannable_string: ^1.0.1
```

Then, run:
```bash
flutter pub get
```

## Usage
```dart
import 'package:flutter/material.dart';
import 'package:flutter_spannable_string/flutter_spannable_string.dart';

void main() {
  runApp(
    MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: RichText(
              text: TextSpan(
                children: SpannableString.parse("Hello { `World` < text-color:#0000FF,text-decoration:underline, font-style:italic, font-size:20 /> }"),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
```
![image](https://i.ibb.co/Bz5JD7X/Screenshot-2023-12-01-224821.png)

## Supported Properties
### `text-color`
to specifies color of text
```dart
SpannableString.parse("Hello { `World` < text-color:#0000FF /> }")
```
![image](https://github.com/Arsybai/flutter-spannable-string/assets/33319709/a1ec8e29-762d-498c-bc54-ba9db726a316)

### `background-color`
specifies the background color of text
```dart
SpannableString.parse("Hello { `World` < background-color:#44FF00FF /> }")
```
![image](https://github.com/Arsybai/flutter-spannable-string/assets/33319709/131bb54f-bb11-4f9a-b74e-6bb26eee4d14)

### `font-size`
set the size of text
```dart
SpannableString.parse("Hello { `World` < font-size:20 /> }")
```
![image](https://github.com/Arsybai/flutter-spannable-string/assets/33319709/5b4ba4b4-d780-4f72-a4aa-04bb7ad1ef25)

### `text-decoration`
set the kind of text decoration like underline, strikethrough etc
```dart
SpannableString.parse("Hello { `Universe` < text-decoration:strikethrough /> } World")
```
![image](https://github.com/Arsybai/flutter-spannable-string/assets/33319709/833cd9a7-3aeb-4cc3-82fd-002485b4b2b1)

### `font-style`
specifies the styles of text
```dart
SpannableString.parse("Hello { `World` < font-style:italic /> }")
```
![image](https://github.com/Arsybai/flutter-spannable-string/assets/33319709/613e4912-7e40-4f3f-bfb4-b3da924d949e)

### `more properties coming soon`

