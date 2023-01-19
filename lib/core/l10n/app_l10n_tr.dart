import 'app_l10n.dart';

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get welcome => 'Hoşgeldiniz!';

  @override
  String get searchHere => 'Buradan ara...';

  @override
  String get emptyBasketText => 'Henüz ürün eklenmemiş. Eklenen ürünler burada görüntülenecektir.';

  @override
  String get basket => 'Sepet';

  @override
  String get confirmBasket => 'Sepeti Onayla';

  @override
  String get total => 'Toplam';
}
