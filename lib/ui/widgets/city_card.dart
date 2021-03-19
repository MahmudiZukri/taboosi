part of 'widgets.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        color: Color(0xFFF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.cityImageURL,
                  fit: BoxFit.cover,
                  height: 102,
                  width: 120,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 50,
                    padding: EdgeInsets.only(left: 5, bottom: 3),
                    decoration: BoxDecoration(
                        color: turquoiseColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                    child: Center(
                      child: Image.asset(
                        city.isAvailable
                            ? 'assets/tersedia.png'
                            : 'assets/tidak_tersedia.png',
                        color: whiteColor,
                        height: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Text(
                city.name,
                style: blackTextFont.copyWith(fontSize: 15),
                overflow: TextOverflow.clip,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
