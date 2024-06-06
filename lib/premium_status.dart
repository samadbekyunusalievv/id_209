import 'package:flutter/material.dart';

class PremiumStatus extends InheritedWidget {
  final bool isPremium;
  final Function(bool) updatePremiumStatus;

  const PremiumStatus({
    Key? key,
    required this.isPremium,
    required this.updatePremiumStatus,
    required Widget child,
  }) : super(key: key, child: child);

  static PremiumStatus of(BuildContext context) {
    final PremiumStatus? result =
        context.dependOnInheritedWidgetOfExactType<PremiumStatus>();
    assert(result != null, 'No PremiumStatus found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PremiumStatus old) {
    return isPremium != old.isPremium;
  }
}
