
                            // (i) => DSTableRow(
                            //   onSelectChanged: (selected) {
                            //     ActionService.run(
                            //       () {
                            //         GoRouter.of(context).pushNamed(
                            //           EditMenuItemScreen.routeName,
                            //           params: {
                            //             'id': i.id!,
                            //           },
                            //         );
                            //       },
                            //       () => AnalyticsService.track(
                            //         message: Analytics
                            //             .ingredientsTabIngredientSelected,
                            //         params: {
                            //           'itemId': i.id!,
                            //           'itemName': i.name,
                            //         },
                            //       ),
                            //     );
                            //   },
                            //   cells: [
                            //     DSTableCell(
                            //       builder: () {
                            //         return DSImageUploadCard(
                            //           theme: DSImageUploadCardThemeData
                            //               .thumbnail(),
                            //           url: i.imageUrl ?? '',
                            //         );
                            //       },
                            //     ),
                            //     DSTableCell(
                            //       builder: () {
                            //         return DSText.bodyText1(i.name);
                            //       },
                            //     ),
                            //     DSTableCell(
                            //       builder: () {
                            //         return DSText.bodyText1(
                            //           (i.priceInfo.price / 100).toCurrency(),
                            //         );
                            //       },
                            //     ),
                            //     DSTableCell(
                            //       builder: () {
                            //         return DSText.bodyText1(
                            //           i.updatedAt?.formatWith(
                            //                 'MM/dd/yy @ h:mm a',
                            //               ) ??
                            //               '',
                            //         );
                            //       },
                            //     ),
                            //   ],
                            // ),
