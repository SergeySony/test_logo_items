enum DataState {data_state_loading, data_state_loaded, data_state_error}

class ItemData {
   List<String> data;
   DataState state;

   ItemData({required this.data, required this.state});
 }