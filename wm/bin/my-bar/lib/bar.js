#!/usr/bin/env node
var Bar = require('bar-provider');
var tags = require('./tags.js');
var date = require('./date.js');
var kodi = require('./kodi.js')('flo-kodi');
var battery = require('./battery.js');

var colors = Array(16).join('.').split('.').map(function(n, i) { return process.env['COLOR' + i]; });

//Setup bar provider
var bar = new Bar()
	.left()
		.bg(colors[5], tags.get)
	.right()
		.bg(colors[7], kodi.get)
		.bg(colors[4], battery.get)
		.bg(colors[6], date.get);

//update bar every 5 seconds
bar.interval(5000);

//update on tag change
tags.wait(bar);
kodi.wait(bar);
