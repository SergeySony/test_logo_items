import 'package:flutter/material.dart';
import 'package:test_project_dev_pace/bloc/items_bloc.dart';
import 'package:test_project_dev_pace/models/ItemData.dart';
import 'package:test_project_dev_pace/widgets/activity_indicator.dart';
import 'package:test_project_dev_pace/widgets/error_widget.dart';
import 'package:test_project_dev_pace/widgets/item_cell.dart';

class LogoItemsPage extends StatefulWidget {
  const LogoItemsPage({super.key});

  @override
  _LogoItemsPageState createState() => _LogoItemsPageState();
}

class _LogoItemsPageState extends State<LogoItemsPage> {
  final ItemsBloc _itemsBloc = ItemsBloc();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _itemsBloc.inputEventSink.add(ItemEvent.event_get_data);
  }

  @override
  void dispose() {
    _itemsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _itemsBloc.outputStateStream,
        initialData: ItemData(data: [], state: DataState.data_state_loading),
        builder: (context, snapshot) {
          return Scaffold(
            body: snapshot.data?.state == DataState.data_state_loading ?
                  ActivityIndicator() :
                  snapshot.data?.state == DataState.data_state_error ?
                  ErrorLoadingWidget() :
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const SizedBox.shrink(),
                            Container(
                              width: viewportConstraints.maxWidth,
                              alignment: Alignment.center,
                              child: Image.asset('images/logo_image.png'),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.data.length,
                              itemBuilder: (context, index) => ItemTile(index),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  ),
            floatingActionButton: snapshot.data?.state == DataState.data_state_loaded ?
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  child: const Icon((Icons.remove), color: Colors.white),
                  onPressed: () {
                    _itemsBloc.inputEventSink.add(ItemEvent.event_remove);
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(microseconds: 100),
                        curve: Curves.ease);
                  }),
              const SizedBox(width: 10),
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: const Icon((Icons.add), color: Colors.white),
                  onPressed: () {
                    _itemsBloc.inputEventSink.add(ItemEvent.event_add);
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(microseconds: 100),
                        curve: Curves.ease);
                  }),
            ]) : snapshot.data?.state == DataState.data_state_error ?
            FloatingActionButton(
                backgroundColor: Colors.grey,
                child: const Icon((Icons.refresh), color: Colors.white),
                onPressed: () {
                  _itemsBloc.inputEventSink.add(ItemEvent.event_get_data);
                }) :
            SizedBox.shrink()
          );
        });
  }
}