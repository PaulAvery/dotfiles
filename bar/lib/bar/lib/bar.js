#!/usr/bin/env node
var Bar = require('bar-provider');
var tags = require('./tags.js');
var date = require('./date.js');
var kodi = require('./kodi.js')('flo-kodi');
var window = require('./window');
var battery = require('./battery.js');
var colors = require('./colors');

//Setup bar provider
var bar = new Bar()
	.left()
		.raw(' ')
		.raw(tags.get)
		.raw(window.get)
	.right()
		.color(colors[7], kodi.get)
		.color(colors[7], battery.get)
		.raw(date.get)
		.raw(' ');

//update bar every 5 seconds
bar.interval(5000);

//update on tag change
kodi.wait(bar);
tags.wait(bar);
window.wait(bar);
