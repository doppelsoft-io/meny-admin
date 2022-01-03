class ActionService {
  static void run(
    Function() action,
    Function() analytics,
  ) {
    action();
    analytics();
  }
}
