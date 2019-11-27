
var L = {
	version: 'dev'
};

function expose() {
	var oldL = window.L;

<<<<<<< HEAD
	L.noConflict = function () {
		window.L = oldL;
		return this;
	};

	window.L = L;
}
=======
L.version = '0.7.7';
>>>>>>> origin/0.7.8

// define Leaflet for Node module pattern loaders, including Browserify
if (typeof module === 'object' && typeof module.exports === 'object') {
	module.exports = L;

// define Leaflet as an AMD module
} else if (typeof define === 'function' && define.amd) {
	define(L);
}

// define Leaflet as a global L variable, saving the original L to restore later if needed
if (typeof window !== 'undefined') {
	expose();
}
