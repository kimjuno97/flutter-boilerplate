import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naym_naym_cook/common/utils/toast.dart';

class BNBLayout extends StatefulWidget {
  final StatefulNavigationShell child;
  const BNBLayout({
    super.key,
    required this.child,
  });

  @override
  State<BNBLayout> createState() => _BNBLayoutState();
}

class _BNBLayoutState extends State<BNBLayout> {
  DateTime? _lastBackPressed;

  Future<bool> _onBackButtonPressed() async {
    if (context.canPop()) {
      return false;
    }
    DateTime currentTime = DateTime.now();
    if (_lastBackPressed == null ||
        currentTime.difference(_lastBackPressed!) >
            const Duration(seconds: 1)) {
      _lastBackPressed = currentTime;
      commonShowToast("한번 더 누를시 앱이 종료됩니다.");
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: _onBackButtonPressed,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.child.currentIndex,
          onTap: (index) {
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.cyclone), label: "wizard"),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: "posts"),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: "my",
            ),
          ],
        ),
      ),
    );
  }
}
