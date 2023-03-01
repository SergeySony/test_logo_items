import 'package:test_project_dev_pace/services/initial_data_provider.dart';

class InitialDataRepository {
  final InitialDataProvider _initialDataProvider = InitialDataProvider();
  Future<bool> getInitialData() => _initialDataProvider.getData();
}