import 'package:flight_log_book/model/widget_model/expansion_RP_card.dart';
import 'package:flight_log_book/utils/app_icons.dart';
import 'package:flutter/material.dart';

class ExpansionCardWidget extends StatefulWidget {
  const ExpansionCardWidget({super.key});

  @override
  State<ExpansionCardWidget> createState() => _ExpansionCardWidgetState();
}

class _ExpansionCardWidgetState extends State<ExpansionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionPanelList.radio(
          initialOpenPanelValue: expansionRPCards,
          children: expansionRPCards
              .map(
                (card) => ExpansionPanelRadio(
                  value: card.header,
                  headerBuilder: (context, isExpanded) =>
                      _buildExpansionCards(context, card),
                  body: _expansionCardsBody(context, card),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildExpansionCards(BuildContext context, ExpansionRPCard card) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppIcons.planeIcon,
                const SizedBox(width: 16),
                Text(
                  'QR 0641',
                  style:
                  Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.4),
            ),
            Padding(
              padding:
              const EdgeInsets.all(8.0).copyWith(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Departure Information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Fri, 11 Oct 24',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '10:55',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'DAC',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium,
                          ),
                          const SizedBox(width: 8),
                          AppIcons.takeOffIcon,
                        ],
                      ),
                    ],
                  ),

                  // Duration and airline logo in the middle
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      Text('5h 50m',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall),
                    ],
                  ),

                  // Arrival Information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Fri, 11 Oct 24',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '13:45',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AppIcons.takeDownIcon,
                          const SizedBox(width: 8),
                          Text(
                            'DOH',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _expansionCardsBody(BuildContext context, ExpansionRPCard card) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aircraft Reg. - S2787',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Aircraft Type - B787',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Captain - Capt. Akram',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'CIC - CIC. Ahsanul',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}




