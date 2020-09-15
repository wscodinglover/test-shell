#! /usr/bin/env node

const util = require('util'),
      spawn = require('child_process').spawn,
      ls = spawn('du', ['-m', '/usr']);

const start = +new Date();
ls.stdout.on('data', function(data) {
  console.log('stdout: %s', data);
});

ls.stderr.on('data', function(data) {
  console.log('stderr: %s', data);
});

ls.on('exit', function(code) {
  const end = +new Date();
  console.log('end-start: ', end-start)
})