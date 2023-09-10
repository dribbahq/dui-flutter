import 'package:flutter/material.dart';
import '../../dui.dart';

class StyledSwitch extends StatefulWidget {
  final void Function(bool isToggled) onChange;
  final bool enabled;

  const StyledSwitch({Key? key, required this.onChange, required this.enabled})
      : super(key: key);

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = false;
  double size = 28;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 12;
    isToggled = widget.enabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onChange(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onChange(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 1.60,
        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerLeft : Alignment.centerRight,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutSine,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isToggled
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(0.1)
                : Theme.of(context).colorScheme.primary),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: DUI.color.white,
          ),
        ),
      ),
    );
  }
}
