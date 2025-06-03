import 'package:sample_project/app/enum/status_msg.dart';

class AppRecord<T> {
  final LadingStatus status;
  final String message;
  final String nextPageUrl;
  final T data;
  const AppRecord._({
    this.status = LadingStatus.loading,
    this.message = "",
    this.nextPageUrl = "",
    required this.data,
  });
  // Success: replace current data
  factory AppRecord.success(T data,
      [String message = 'Success', String nextPageUrl = ""]) {
    return AppRecord._(
      status:
          nextPageUrl.isEmpty ? LadingStatus.noloadmore : LadingStatus.success,
      data: data,
      message: message,
    );
  }
  // Load more: append to current list
  factory AppRecord.loadMore({
    required List<T> currentData,
    required List<T> newData,
    String nextPageUrl = "",
    String message = 'Load more',
  }) {
    final List<T> combined = [...currentData, ...newData];
    return AppRecord._(
      status:
          nextPageUrl.isEmpty ? LadingStatus.noloadmore : LadingStatus.success,
      data: combined as T,
      nextPageUrl: nextPageUrl,
      message: message,
    );
  }
  factory AppRecord.loading({
    required T defaultData,
    String message = 'Loading...',
  }) {
    return AppRecord._(
      status: LadingStatus.loading,
      data: defaultData,
      message: message,
    );
  }
  // Error from server
  factory AppRecord.error({
    required T defaultData,
    String message = 'Error',
  }) {
    return AppRecord._(
      status: LadingStatus.failed,
      data: defaultData,
      message: message,
    );
  }

  factory AppRecord.warning({
    required T defaultData,
    String message = 'Error',
  }) {
    return AppRecord._(
      status: LadingStatus.warning,
      data: defaultData,
      message: message,
    );
  }
  bool get isSuccess => status == LadingStatus.success;
  bool get isNoLoadMore => status == LadingStatus.noloadmore;
  bool get isLoading => status == LadingStatus.loading;
  bool get isLoadingMore => status == LadingStatus.loadmore;
  bool get isError => status == LadingStatus.failed;
  bool get isWarning => status == LadingStatus.warning;
}
