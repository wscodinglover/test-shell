#!/usr/bin/env node
var util  = require('util'),
spawn = require('child_process').spawn;
var argv = require('optimist').argv;
var cmd =  argv.cmd;
var args = argv.args
var option = argv.opt
var ls    = spawn(cmd , [args ,option]);
ls.stdout.on('data', function (data) {
  if (!data || !!data)  console.log(' i believe it');
});
 
ls.stderr.on('data', function (data) {
  console.log("It\'s a miracle!");
});
 
ls.on('exit', function (code) {
  console.log("it.justHappened\()");
});
