class Urls {
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String loginUrl = '$baseUrl/login';
  static String registrationUrl = '$baseUrl/registration';
  static String createNewTaskUrl = '$baseUrl/createTask';
  static String newTasksUrl = '$baseUrl/listTaskByStatus/New';
  static String completedTasksUrl = '$baseUrl/listTaskByStatus/Completed';
  static String inprogressTasksUrl = '$baseUrl/listTaskByStatus/Inprogress';
  static String cancelledTasksUrl = '$baseUrl/listTaskByStatus/Cancelled';
  static String profileUpdate = '$baseUrl/profileUpdate';
  static String updateTaskStatus(String taskId, String status) => '$baseUrl/updateTaskStatus/$taskId/$status';
  static String deleteTask(String taskId) => '$baseUrl/deleteTask/$taskId';
}