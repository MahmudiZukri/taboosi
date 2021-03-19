part of 'widgets.dart';

class TextfieldCard extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final double height;
  final double width;
  final bool inputNumber;
  final int maxLines;
  final Function onChanged;

  TextfieldCard(
      {this.labelText,
      this.hintText,
      this.controller,
      this.height = 60,
      this.width,
      this.inputNumber = false,
      this.maxLines,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        maxLines: maxLines,
        keyboardType: inputNumber ? TextInputType.number : null,
        controller: controller,
        onChanged: onChanged,
        style:
            blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
