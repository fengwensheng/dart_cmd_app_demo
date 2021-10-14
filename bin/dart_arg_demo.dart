import 'package:args/args.dart';

void main(List<String> arguments) {
  var argParser = ArgParser();
  //输入格式为'--mode value'或'-m value'
  argParser.addOption(
    'mode',
    abbr: 'm',
    defaultsTo: 'debug',
    allowed: ['debug', 'release'],
    callback: (m) => print('gb: current [mode] value is: [$m]'),
    //若必选，则不可有default
    // mandatory: true,
  );
  ////输入格式为'--verbose'或'-v'
  ///注意flag与option不同，其为bool变量，只有true或false，即设与未设之分
  ///故不需传值，只要设了就是true，未设则为false
  argParser.addFlag(
    'verbose',
    abbr: 'v',
    defaultsTo: false,
    callback: (v) => print('gb: current [verbose] value is: [$v]'),
  );
  //应用该parser
  // var argResult = argParser.parse(arguments);
  // print('the verbose value: ${argResult['verbose']}');
  //多余字段
  //dart run bin/dart_demo.dart -m release -v aaa bbb ccc
  //rest option: [aaa, bbb, ccc]
  // print('rest option: ${argResult.rest}');
  //command
  //A command is a named argument that has its own set of options.
  //以上传的参数不在一个命令下，命令可以理解为本身带参数集的参数
  //自定义一个命令 返回一个新的argParser
  var sayArgParser = argParser.addCommand('say');
  sayArgParser.addFlag('hello');
  //实现链式调用，而不是各个子命令的分隔
  //子命令只需保存result的引用，最后统一用root的parser
  var sayArgResult = argParser.parse(arguments);
  print('say hello: ${sayArgResult.command!['hello']}');
  //若构建cmd tool，Arg包内额外有一个封装好的类CommandRunner，取代ArgParser
  // When using the CommandRunner it replaces the ArgParser.
  //其实就是帮我们架构好应用的组织结构 分层明确 command下放到类中 而不是命令式的创建
  //定义xxCommand继承自Command
}
