import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getLocalizedCurrency(BuildContext context, double currency) {
  return "${NumberFormat(
    Localizations.localeOf(context).countryCode,
  ).format(currency)}";
}
