
import 'package:flutter/material.dart';

class PermissionSwitch extends StatelessWidget {
  final bool isSwitched;
  final VoidCallback onChanged;

  const PermissionSwitch({required this.isSwitched, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSwitched ? Colors.blue : Colors.grey[350],
          border: Border.all(
            color: isSwitched ? Colors.blue : Colors.grey[350]!,
            width: 2.0,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              left: isSwitched ? 30 : 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,
                  );
                },
                child: GestureDetector(
                  onTap: onChanged,
                  child: Center(
                    child: Icon(
                      isSwitched ? Icons.circle : Icons.circle,
                      color: Colors.white,
                      size: 26.0,
                      key: ValueKey<bool>(isSwitched),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}