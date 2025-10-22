import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(printer: PrettyPrinter(), level: Level.debug);

class CustomLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    // 非开发模式不输出日志信息
    if (kDebugMode) {
      return <String>[];
    }
    final String time = DateTime.now().toIso8601String();
    final String level = event.level.name.toUpperCase();
    final dynamic message = event.message;
    final String error = event.error != null ? 'Error: ${event.error}' : '';
    final String stackTrace = event.stackTrace != null ? 'StackTrace: ${event.stackTrace}' : '';

    return <String>['[$time] [$level] $message $error $stackTrace'];
  }
}

/// 列表日志拓展
extension LoggerList on Logger {
  // 快速打印列表日志
  // [list] 需要打印的列表
  // [builder] 为空时直接打印元素（适合基础类型） 不为空时打印自定义内容（适合对象）
  // [level] 日志级别
  //   final List<LoggerTest> testList = [
  //       LoggerTest(id: 1, name: 'smith', age: 20),
  //       LoggerTest(id: 2, name: 'collen', age: 15),
  //       LoggerTest(id: 3, name: 'marin', age: 30),
  //     ];
  //  logger.list(testList,builder: (LoggerTest item) =>'${item.id}|${item.name}|${item.age}', level: Level.info);
  void list<T>(List<T> list, {String Function(T item)? builder, Level level = Level.debug}) {
    if (list.isEmpty) {
      _log('[]', level);
      return;
    }
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < list.length; i++) {
      final String text = builder != null ? builder(list[i]) : list[i].toString();
      buffer.writeln('[$i] $text');
    }
    _log(buffer.toString().trimRight(), level);
  }

  void _log(String content, Level level) {
    if (level == Level.info) {
      i(content);
    } else if (level == Level.warning) {
      w(content);
    } else if (level == Level.error) {
      e(content);
    } else {
      d(content);
    }
  }
}
