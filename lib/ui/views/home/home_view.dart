import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/app.router.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/dimensions.dart';
import 'package:pataya_ending_card/ui/widgets/common/card_item/card_item.dart';
import 'package:pataya_ending_card/ui/widgets/special/empty_display.dart';
import 'package:pataya_ending_card/ui/widgets/special/scaffold_list_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CARDS"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              locator<RouterService>()
                  .navigateToCardView(card: ECard(), action: ActionType.add);
            },
            child: const Icon(Icons.add)),
        body: ScaffoldListWrapper(
          onRefresh: () async {
            await viewModel.getAll();
          },
          itemCount: viewModel.cards.length,
          emptyIndicatorWidget: const EmptyDisplay(
              icon: Icons.sports_basketball_rounded, title: "NO CARDS"),
          builder: (context, size) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1),
              padding: Dimens.computedWidth(
                  screenSize: size, targetWidth: 500, hPadding: 0, vPadding: 0),
              itemCount: viewModel.cards.length,
              itemBuilder: (context, index) {
                final item = viewModel.cards[index];
                return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.green,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.archive,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.red,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onDismissed: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        await viewModel.deleteCard(item.id.toString());
                        /*  ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Deleted $item')),
                            ); */
                      } else {
                        /*  ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Archived $item')),
                            ); */
                      }
                    },
                    child: Card(
                        margin: EdgeInsetsDirectional.zero,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        child: InkWell(
                            onTap: () {
                              viewModel.routingService.navigateTo(
                                  CardSlotsViewRoute(
                                      card: item, action: ActionType.add));
                            },
                            child: CardItem(item))));
              },
            );
          },
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.getAll();
    super.onViewModelReady(viewModel);
  }
}
