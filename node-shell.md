// 1.构建项目目录
mkdir xxx
cd xxx
npm init

// 2.安装commander模块
npm install commander --save

// 3.新建bin/[你自定义的命令行文件名]
#!/usr/bin/env node

var program = require('commander');

program.version('0.0.1');

program
    .command('help')
    .description('显示使用帮助')
    .action(function() {
        program.outputHelp();
    });

program
    .command('create [dir]')
    .description('创建一个空博客')
    .action(function(dir) {
        console.log('create %s', dir);
    });

program
    .command('preview [dir]')
    .description('实时预览')
    .action(function(dir) {
        console.log('preview %s', dir);
    });

program
    .command('build [dir]')
    .description('生成整站静态HTML')
    .option('-o, --output <dir>', '生成的静态HTML存放目录')
    .action(function(dir) {
        console.log('创建 %s, 输出 %s', dir, options.output);
    });

// 开始解析命令
program.parse(process.argv);

// 4.在package.json目录下执行关联操作
npm link

// 5.测试,输入相关命令即可执行对应操作
xxx help