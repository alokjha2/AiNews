import 'package:ainews/import.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.title,
    required this.tapEvent, 
    this.color
  }) : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: tapEvent,
      highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: 
            
            color == null ?
            kTextColor : color
          ),
        ),
      ),
    );
  }
}