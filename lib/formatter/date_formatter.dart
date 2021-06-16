import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getTimestampToDate(
    BuildContext context, double timestamp, String dateFormat) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
  var formatter =
      DateFormat(dateFormat, Localizations.localeOf(context).countryCode);
  return formatter.format(date);
}
