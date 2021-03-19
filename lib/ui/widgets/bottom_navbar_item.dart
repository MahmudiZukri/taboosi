part of 'widgets.dart';

class BottomNavbarItem extends StatelessWidget {
  final String iconURL;
  final Function onTap;
  final bool isActive;
  final double iconSize;

  BottomNavbarItem(
      {this.iconURL, this.onTap, this.isActive = false, this.iconSize = 26});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Spacer(),
          Image.asset(iconURL,
              height: iconSize,
              color: isActive
                  ? turquoiseColor
                  : iconSize != 26
                      ? turquoiseColor
                      : Color(0xFF989BA1)),
          Spacer(),
          isActive
              ? Container(
                  height: 2,
                  width: 30,
                  decoration: BoxDecoration(
                    color: turquoiseColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000)),
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
