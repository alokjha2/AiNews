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
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            color: 
            
            color == null ?
            kTextColor : color
            // fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}