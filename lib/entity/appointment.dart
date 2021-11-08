import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Appointment {
  String doctor;
  double price;
  int consultation;
  String date;
  String status;

  Appointment(this.doctor, this.price, this.consultation, this.date, this.status);

  static String finished = 'finished';
  static String upcoming = 'upcoming';
  static String canceled = 'canceled';
  static String rejected = 'rejected';

  String statusText(context) {
    if (status == finished) {
      return AppLocalizations.of(context).previous;
    } else if (status == upcoming) {
      return AppLocalizations.of(context).upcoming;
    } else if (status == canceled) {
      return AppLocalizations.of(context).canceled;
    } else {
      return AppLocalizations.of(context).rejected;
    }
  }

  Color statusColor() {
    if (status == finished) {
      return Colors.green;
    } else if (status == upcoming) {
      return Colors.green;
    } else if (status == canceled) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }
}

