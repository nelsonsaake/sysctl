import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:commons/helpers/str.dart';
import 'package:devpanel/helpers/md.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'dyno.dart';

class DynoRunner {
  //...

  final Dyno dyno;

  final key = GlobalKey();

  final changeStreamController = StreamController.broadcast();

  DynoRunner({required this.dyno});

  Process? _proc;

  bool get isActive => _proc != null;

  Stream<String>? _outStream;

  Stream<String>? get outStream => _outStream;

  Stream<String>? _errStream;

  Stream<String>? get errStream => _errStream;

  Stream<String>? _stream;

  Stream<String>? get stream => _stream;

  Stream get changeStream => changeStreamController.stream;

  String _out = "";

  String get out => _out;

  String get dynoCommand => dyno.exec.split(" ").firstOrNull ?? "";

  List<String> get arguments => dyno.exec.split(" ").skip(1).toList();

  log(String msg) {
    _out += toMD("$msg\n");
    notifylisteners("proc(${dyno.name}) $msg");
  }

  clearLogs() {
    _out = "";
  }

  notifylisteners(event) {
    // debugPrint("$event");
    changeStreamController.add(event);
  }

  Future _start() async {
    if (_proc != null) return;

    clearLogs();

    _proc = await Process.start(
      dynoCommand,
      arguments,
      workingDirectory: dyno.workingDirectory,
    );

    _outStream =
        _proc?.stdout.transform(const AsciiDecoder()).asBroadcastStream();
    _errStream = _proc?.stderr.transform(utf8.decoder).asBroadcastStream();
    _stream = _outStream?.mergeWith([if (_errStream != null) _errStream!]);

    _stream?.listen((event) {
      _out += toMD(event);
      notifylisteners(event);
    });

    _proc?.exitCode.then((exitCode) {
      _proc = null;
      _outStream = null;
      _errStream = null;
      _stream = null;
      notifylisteners("cleared!");
    });
  }

  Future start() async {
    log("starting...");
    await _start();
    log("started");
  }

  Future _stop() async {
    if (_proc == null) return;

    await Process.start(
      "taskkill",
      ["/PID", str(_proc?.pid), "/T", "/F"],
    );
  }

  Future stop() async {
    log("stoping...");
    await _stop();
    log("stopped");
  }

  Future restart() async {
    log("restarting...");

    await _stop();
    await _proc?.exitCode;
    await _start();

    log("restarted");
  }
}
