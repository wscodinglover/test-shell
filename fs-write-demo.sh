#! /usr/bin/env node
const fs = require('fs');

const readAndWriteData = fs.readFileSync('./node-shell.md','utf8', (err, data) => {
  if(err) {
    console.log('读取文件出错！', err);
    return;
  }
  return data
  // console.log('读取文件', data);
})

fs.writeFileSync('./temp.md', readAndWriteData, (error, data) => {
  if(error) {
    console.log('写入文件出错了', error)
    return
  }
  console.log('成功写入temp.md')
})

const file = 'app.log'
const file1 = 'app-1.log' 

// 检查文件是否存在当前目录中
fs.access(file, fs.constants.F_OK, (err)=> {
  console.log(`${file} ${err ? '不存在' : '存在'}`)
})

fs.access(file1, fs.constants.F_OK, (err) => {
  console.log(`${file1} ${err ? '不存在' : '存在'}`)
})

// 检查文件是否可读
fs.access(file, fs.constants.R_OK, (err) => {
  if(err){
    console.log('err: ', err)
    return;
  }
  console.log(`${file} -> ${err ? '不可读' : '可读'}`)
})


// 检查文件是否可写
fs.access(file, fs.constants.W_OK, (err) => {
  if(err) {
    console.log('err: ', err)
    return;
  }
  const msg = err ? '不可写' : '可写'
  console.log('%s -> %s', file, msg);
})

//fs.access(file1, fs.constants.W_OK, (err) => {
//  if(err) {
//    console.log('err: ', err)
//    return;
//  }
//  const msg = err ? '不可写' : '可写'
//  console.log('%s -> %s', file1, msg);
//})