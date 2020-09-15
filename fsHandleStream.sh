#! /usr/bin/env node


//方案一：
const fs = require('fs');
const readStreamData = fs.createReadStream('./app.log');
const writeStreamData = fs.createWriteStream('./stream-temp.md');

readStreamData.on('data', function(chunk) {
  //当有数据流出时，写入数据
  if(writeStreamData.write(chunk)===false){
    // 如果没有写完，暂停读取流
    readStreamData.pause();
  }
})

writeStreamData.on('drain', function() {
  // 写完后 ，继续读取数据
  readStreamData.resume();
})

readStreamData.on('end', function() {
  // 当没有数据读取时，关闭数据流
  writeStreamData.end();
})

//方案二
// pipe自动调用了data,end等事件
fs.createReadStream('./app.log').pipe(fs.createWriteStream('./app-backup.log'));
