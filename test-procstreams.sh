#! /usr/bin/env node

const p = require('procstreams');

p('cat app.log').pipe('wc -l').data(function(stdout, stderr) {
    console.log('-data-', stdout)
    console.log('-err-', stderr)
  })