import 'package:dreamlendar/db/db_Helper.dart';
import 'package:dreamlendar/models/task.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    var val = DBHelper.delete(task);
    print(val);
  }
}
