'use strict';
const EXCLUDED_FILES = ['.DS_Store', 'README.md', '.gitignore', '.git',
                        'install.js', 'osx_config.sh'];
const fs = require('fs');
const readline = require('readline');
const exec = require('child_process').exec;

const rl = readline.createInterface(process.stdin, process.stdout);
const files = fs.readdirSync(__dirname)
  .filter(file => !~EXCLUDED_FILES.indexOf(file));

iterate(files, 0);

// iterate recursively over files, allowing blocking prompt between files
function iterate(files, index, overwrite) {
  const file = files[index];
  if (undefined === file) {
    console.log('\nDone ☕️');
    console.log('Run osx_config.sh to configure OSX');
    process.exit(0);
  }
  const target = process.env['HOME'] + '/.' + file;

  // exception means file doesn't exist
  let fileExists = false;
  try {
    fs.accessSync(target, fs.F_OK);
    fileExists = true;
  } catch (e) {
    fileExists = false;
  }

  if (fileExists && !overwrite) {
    rl.question(target + ' already exists. Overwrite? [yNaq] ', answer => {
      if (answer === 'y') {
        linkFile(file);
      } else if (answer === 'a') {
        linkFile(file);
        overwrite = true;
      } else if (answer === 'q') {
        process.exit(0);
      } else {
        console.log('Skipping .' + file);
      }
      iterate(files, index+1, overwrite);
    });
  } else {
    linkFile(file);
    iterate(files, index+1, overwrite);
  }
}

function linkFile(file) {
  console.log('linking file .' + file);
  const target = process.env['HOME'] + '/.' + file;
  // unlink the file preemptively, just catch errors for non-existent files
  rmFile(target);
  fs.symlinkSync(__dirname + '/' + file, target);
}

function rmFile(target) {
  let stat;
  try {
    stat = fs.lstatSync(target);
  } catch (e) {
    // ignore non-existent files
    if (e.code === 'ENOENT') {
      return;
    }
  }
  return stat.isDirectory() ? rmDir(target) : fs.unlinkSync(target);
}

// recursively remove directory
function rmDir(path) {
  fs.readdirSync(path).forEach((file,index) => {
      const curPath = path + "/" + file;
      if (fs.lstatSync(curPath).isDirectory()) {
          return rmDir(curPath);
      }
      fs.unlinkSync(curPath);
  });
  return fs.rmdirSync(path);
}

