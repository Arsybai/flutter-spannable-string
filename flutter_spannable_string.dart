import 'package:flutter/material.dart';

class SpannableString {
  static List<TextSpan> parse(String input) {
    List<TextSpan> spans = [];
    RegExp exp = RegExp(r'{ `([^`]+)` <([^/>]+) /> }');

    int index = 0;

    exp.allMatches(input).forEach((match) {
      // Add the text before the matched pattern
      spans.add(TextSpan(
        text: input.substring(index, match.start),
      ));

      // Extract the content and properties from the match
      String content = match.group(1)!;
      String properties = match.group(2)!;

      // Parse properties
      Map<String, String> styleMap = parseProperties(properties);

      // Add the styled text
      spans.add(TextSpan(
        text: content,
        style: TextStyle(
          color: styleMap['text-color'] != null
              ? parseColor(styleMap['text-color'])
              : null,
          backgroundColor: styleMap['background-color'] != null
              ? parseColor(styleMap['background-color'])
              : null,
          fontSize: styleMap['font-size'] != null
              ? double.parse(styleMap['font-size']!)
              : null,
          decoration: parseTextDecoration(styleMap['text-decoration']),
          fontStyle: parseFontStyle(styleMap['font-style'])
        ),
      ));

      // Update the index to point to the end of the matched pattern
      index = match.end;
    });

    // Add the remaining text after the last matched pattern
    if (index < input.length) {
      spans.add(TextSpan(
        text: input.substring(index),
      ));
    }

    return spans;
  }

  static Map<String, String> parseProperties(String properties) {
    Map<String, String> styleMap = {};
    List<String> propertyList = properties.split(',');
    for (String property in propertyList) {
      List<String> keyValue = property.trim().split(':');
      if (keyValue.length == 2) {
        styleMap[keyValue[0].trim()] = keyValue[1].trim();
      }
    }
    return styleMap;
  }

  static Color parseColor(String? value) {
    if (value == null) {
      return Colors.black; // Default color
    }

    if (value.startsWith('#') && (value.length == 7 || value.length == 9)) {
      // Hexadecimal color code
      String hex = value.replaceAll('#', '');
      int intValue = int.parse(hex, radix: 16);

      if (value.length == 7) {
        // If the color code doesn't include alpha, set alpha to 255 (fully opaque)
        intValue |= 0xFF000000;
      }

      return Color(intValue);
    }

    return Colors.black; // Default color
  }

  static TextDecoration? parseTextDecoration(String? value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case 'underline':
        return TextDecoration.underline;
      case 'strikethrough':
        return TextDecoration.lineThrough;
      default:
        return null;
    }
  }

  static FontStyle? parseFontStyle(String? value) {
    if (value == 'italic') {
      return FontStyle.italic;
    }
    return null;
  }

  static FontWeight? parseFontWeight(String? value) {
    if (value == 'bold') {
      return FontWeight.bold;
    }
    return null;
  }

  static double? parseBaseline(String? value) {
    if (value != null && (value == 'subscript' || value == 'superscript')) {
      // Adjust baseline for subscript and superscript
      return value == 'subscript' ? -0.5 : 0.5;
    }
    return null;
  }

}
