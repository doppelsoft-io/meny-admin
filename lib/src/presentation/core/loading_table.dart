import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class LoadingTable extends StatelessWidget {
  const LoadingTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DSSpacing.xs),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 175,
                        height: 28,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: DSSpacing.md,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 125,
                        height: 50,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: DSSpacing.md,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 28),
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
