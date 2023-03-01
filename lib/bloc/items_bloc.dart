import 'dart:async';
import 'package:test_project_dev_pace/models/ItemData.dart';
import 'package:test_project_dev_pace/services/initial_data_repository.dart';

enum ItemEvent {event_remove, event_add, event_get_data}

class ItemsBloc {
  ItemData _itemData = ItemData(data: [], state: DataState.data_state_loading);
  InitialDataRepository _dataRepository = InitialDataRepository();

  final _inputEventController = StreamController<ItemEvent>();
  StreamSink<ItemEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<ItemData>();
  Stream<ItemData> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ItemEvent event) async {
    if (event == ItemEvent.event_get_data) {
      _itemData.state = DataState.data_state_loading;
      _outputStateController.sink.add(_itemData);

      bool _response = await _dataRepository.getInitialData();
      if (_response == true) {
        _itemData.state = DataState.data_state_loaded;
      } else {
        _itemData.state = DataState.data_state_error;
      }
    } else if (event == ItemEvent.event_remove) {
      if (_itemData.data.isNotEmpty) {
        _itemData.data.removeLast();
      }
    } else if (event == ItemEvent.event_add) {
      _itemData.data.add('Item');
    } else {
      throw Exception('Wrong Event');
    }

    _outputStateController.sink.add(_itemData);
  }

  ItemsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}