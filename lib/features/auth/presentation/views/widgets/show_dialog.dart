import 'package:animated_snack_bar/animated_snack_bar.dart';

AnimatedSnackBar ShowAnimatedSnackbar({
  required String message,
  required AnimatedSnackBarType type,
}) {
  return AnimatedSnackBar.material(
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    duration: Duration(seconds: 4),
    message,
    type: type,
  );
}
