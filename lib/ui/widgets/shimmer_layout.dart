part of 'widgets.dart';

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 110,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width - 2 * edge - 130 - 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                    height: 14,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width -
                        2 * edge -
                        110 -
                        20),
                SizedBox(height: 13),
                Container(
                    height: 14,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width - 2 * edge - 200),
                Spacer(),
                Container(
                    height: 10,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width -
                        2 * edge -
                        110 -
                        20),
                Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
