

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

final expansionRPCards = <ExpansionRPCard>[
  ExpansionRPCard(
    header: const Card(),
    body: const [],
  ),
];
