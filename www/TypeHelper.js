cordova.define("cordova.plugin.TypeHelper.TypeHelper", function(require, exports, module) {
/*
 * @author Evgeniy Lukovsky
 * */

	var exec = require('cordova/exec');

	var TypeHelper=function(){
	};

	TypeHelper.prototype.getFile = function( successCallback, errorCallback) 
	{
		return cordova.exec(successCallback, errorCallback, "TypeHelper", "getFile", []);
	};

	module.exports= new TypeHelper();

});
