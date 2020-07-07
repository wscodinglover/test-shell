#! /usr/bin/env node
var argv = require('yargs')
  .option('f', {
	alias : 'name',
	demand: true,
	default:'tom',
	describe:'your name',
	type:'string'
  })
  .usage('Usage: hello [options]')
  .example('hello -n tom', 'hello, Tom')
  .help('h')
  .alias('h','help')
  .epilog('copyright 2015')
  .argv;
  
console.log('hello, %s; this is a new shell!', argv.n)


// console.log('process', process)
