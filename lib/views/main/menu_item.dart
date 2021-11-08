import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final Function onClick;

  const MenuItem(this.icon, this.isSelected, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        elevation: 0,
        height: 60,
        color: Colors.white,
        highlightElevation: 0,
        onPressed: () => onClick(),
        highlightColor: const Color(0xffE8ECFB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SvgPicture.asset('images/$icon.svg', color: itemColor()),
      ),
    );
  }

  Color itemColor() => isSelected ? const Color(0xff3B59BC) : const Color(0xff9DA2AA);
}
