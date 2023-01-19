import 'app_l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!';

  @override
  String get searchHere => 'Search here...';

  @override
  String get emptyBasketText => 'No added product yet. Added products will appear here.';

  @override
  String get basket => 'Basket';

  @override
  String get confirmBasket => 'Confirm Basket';

  @override
  String get total => 'Total';
}
