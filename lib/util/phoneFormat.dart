import 'package:flutter/services.dart';

class UzbekCodeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    if (newValue.text.length > oldValue.text.length) {
      switch (newTextLength) {
        case 1:
          {
            newText.clear();
            newText.write("+998 ");
            newText.write(newValue.text[oldValue.text.length]);
            selectionIndex = 6;
          }
          break;

        case 4:
          {
            newText.write(" ");
            selectionIndex = 5;
          }
          break;
        case 5:
          {
            newText.clear();
            newText.write(oldValue.text);
            newText.write(" ");
            newText.write(newValue.text[oldValue.text.length]);
            selectionIndex = 6;
          }
          break;
        case 7:
          {
            newText.write(" ");
            selectionIndex = 8;
          }
          break;
        case 8:
          {
            newText.clear();
            newText.write(oldValue.text);
            newText.write(" ");
            newText.write(newValue.text[oldValue.text.length]);
            selectionIndex = 9;
          }
          break;
        case 11:
          {
            newText.write(" ");
            selectionIndex = 12;
          }
          break;
        case 12:
          {
            newText.clear();
            newText.write(oldValue.text);
            newText.write(" ");
            newText.write(newValue.text[oldValue.text.length]);
            selectionIndex = 13;
          }
          break;
        case 14:
          {
            newText.write(" ");
            selectionIndex = 15;
          }
          break;
        case 15:
          {
            newText.clear();
            newText.write(oldValue.text);
            newText.write(" ");
            newText.write(newValue.text[oldValue.text.length]);
            selectionIndex = 16;
          }
          break;
      }
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
