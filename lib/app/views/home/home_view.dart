import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/constants/dimensions.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:pataya_ending_card/app/views/slots/card_slots_view.dart';
import 'package:stacked/stacked.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/views/home/home_viewmodel.dart';

import '../../routes/app_router.dart';
import '../../ui/_core/empty_display.dart';
import '../../ui/_core/scaffold_list_wrapper.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("CARDS"),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
                ],
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    locator<AppRouter>().push(
                      CardRoute(card: ECard(), action: ActionType.add),
                    );
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
                  return ListView.builder(
                    padding: Dimens.computedWidth(
                        screenSize: size,
                        targetWidth: 500,
                        hPadding: 15,
                        vPadding: 15),
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
                            child: InkWell(
                              onTap: () {
                                viewModel.navigationService
                                    .pushWidget(CardSlotsView(
                                  card: item,
                                  action: ActionType.update,
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${item.teamOneName ?? ""} vs. ${item.teamTwoName ?? ""} ",
                                        ),
                                        Text(item.title ?? ""),
                                        if (item.date != null)
                                          Text(DateFormat('EEE, MMM. d y h:mma')
                                              .format(
                                                  item.date ?? DateTime.now())),
                                      ],
                                    )),
                                    hSpaceRegular,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Score : ${item.teamOneScore ?? ""} ${item.teamTwoScore != null ? "- ${item.teamTwoScore}" : ""}"),
                                        const Text("Slots   : 24/99"),
                                        const Text("Paid    : 7/9"),
                                        const Text("Win    : 7/9"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                },
              ));
        });
  }
}
