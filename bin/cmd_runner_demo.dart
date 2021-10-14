import 'package:args/command_runner.dart';

void main(List<String> args) {
  CommandRunner('CmdRunnerTester', 'test command runner')
    ..argParser.addFlag(
      'verbose',
      abbr: 'v',
      help: 'show more detail...',
      callback: (v) => 'CMDR::V:$v',
    )
    ..addCommand(Cmd1())
    ..addCommand(Cmd2())
    ..run(args);
}

class Cmd1 extends Command {
  //add option and flag in constructor
  Cmd1() {
    argParser.addOption(
      'test1',
      abbr: 't',
      // callback: ...remove to Cmd1:run()
    );
  }
  @override
  String get description => 'test command:1';

  @override
  String get name => 'Cmd1';

  @override
  void run() {
    print('Cmd1::test1:${argResults?['test1']}');
  }
}

class Cmd2 extends Command {
  @override
  String get description => 'test command:2';

  @override
  String get name => 'Cmd2';
}
