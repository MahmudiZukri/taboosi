part of 'widgets.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function onTap;

  NoteCard(this.note, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap(),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                height: 80,
                width: 80,
                child: Image.asset(
                  note.noteImageURL,
                ),
              )),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.name, style: blackTextFont),
            SizedBox(height: 4),
            Text(note.desc, style: greyTextFont),
          ],
        ),
        Spacer(),
        IconButton(
          splashRadius: 24,
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            size: 24.0,
            color: Color(0xFFC9C9C9),
          ),
        )
      ],
    );
  }
}
