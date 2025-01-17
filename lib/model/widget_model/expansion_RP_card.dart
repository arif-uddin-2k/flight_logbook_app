

import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExpansionRPCard {
  late final Widget header;
  late final List<Widget> body;
  late bool isExpanded;

  ExpansionRPCard({
    required this.header,
    this.body = const [],
    this.isExpanded = false,
  });
}

final expansionRPCards = <ExpansionRPCard> [

];
