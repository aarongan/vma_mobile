// = ics.profile.js
// this file should be placed in dojotoolkit/util/buidscripts/profiles\\
// for resources related to dojo's build system see:
// *[[http://docs.dojocampus.org/build/index|Dojo Build System]]
// *[[http://docs.dojocampus.org/build/buildScript|Build Script]]
// *[[http://docs.dojocampus.org/build/profiles|Build Profiles]]


dependencies = {
	// == isStatic
	// this relates to our {{{ics.app.config.isStatic}}} variable used for development
	// this should always be false for production
	isStatic: false,
	
	// == action
	// this should probably always be release
	// other possible values are clean or help
	action: 'release',
	
	// == version
	// this is our version number which will be returned via dojo.version
	// ics.dojo.patches has dependencies on this number - it should match
	// the actual version of dojo being used with the last segment being
	// available for us to change as needed.
	version: '1.4.2.' +new Date().getTime(),
	
	// == log
	// we can have the following log levels:
	//	TRACE: 0,
	//	INFO: 1,
	//	WARN: 2,
	//	ERROR: 3
	log: logger.TRACE,
	
	// == releaseName
	// this is the name of the directory that the build will be put in
	releaseName: 'release',
	
	// == releaseDir
	// this is the path to where the build directory will be
	releaseDir: '../../../',
	
	// == cssOptimize
	// this should probably always be comments
	// an alternative is comments.keepLines which will still strip comments
	// and inline @import calls but will preserve line returns
	cssOptimize: 'comments',
	
	// == optimize and layerOptimize
	// for debugging
	optimize: 'shrinksafe.keepLines',
	layerOptimize: 'shrinksafe.keepLines',
	
	// == stripConsole
	// this will leave in console.warn and console.error - use 'all' to remove them
	stripConsole: 'normal',
	
	// this removes the demos and tests, etc from the dojo distribution
	mini: true,
	
	// == localeList
	// list of locales we support
	localeList: 'en-us',
	
	// == loader and xdDojoPath
	// XD stuff - comment these 2 lines for a local build
	loader: 'xdomain',
	//xdDojoPath: 'http://icsdevimgs.odc.vzwcorp.com/ics/scripts/release',
	xdDojoPath: 'http://127.0.0.1:9080/ics/scripts/release',

	// == layers
	// we have 2 layers - kernel and app.  app has a dependency on kernel
	layers: [
		{
			name: '../ics/kernel.js',
			dependencies: [
				'ics.kernel'
			]
		},
		{
			name: '../ics/app.js',
			dependencies: [
				'ics.app'
			],
			layerDependencies: [
				'../ics/kernel.js'
			]
		}
	],
	
	// == prefixes
	// we should provide a 3rd param to these prefixes which would be a path to a 
	// copyright file - for example:
	// ['ics', '../../ics', '../../ics/copyright.txt']
	prefixes: [
		['dijit', '../dijit'], 
		['dojox', '../dojox'], 
		['ics', '../../ics'], 
		['styles', '../../../styles']
	]
};
