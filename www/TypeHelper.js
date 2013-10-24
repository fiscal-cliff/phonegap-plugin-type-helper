
/*
 * @author Evgeniy Lukovsky
 * */

	var exec = require('cordova/exec');

	var TypeHelper=function(){
	};

	TypeHelper.prototype.getFile = function( successCallback, errorCallback) 
	{
		return cordova.exec(successCallback, errorCallback, "ExtractZip", "extract", []);
	};

	module.exports= new TypeHelper();

