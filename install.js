'use strict';
const EXCLUDED_FILES = ['README.md', '.gitignore', '.git', 'install.js'];
const fs = require('fs');
const readline = require('readline');

let rl = readline.createInterface(process.stdin, process.stdout);
let files = fs.readdirSync(__dirname)
	.filter(file => !~EXCLUDED_FILES.indexOf(file));

iterate(files, 0);

// iterate recursively over files, allowing blocking prompt between files
function iterate(files, index, overwrite) {
	let file = files[index];
	if (undefined === file) {
		console.log('Done!');
		process.exit(0);
	}
	let target = process.env['HOME'] + '/.' + file;

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
			//rl.close();
		});
	} else {
		linkFile(file);
		iterate(files, index+1, overwrite);
	}
}

function linkFile(file) {
	console.log('linking file .' + file);
}
