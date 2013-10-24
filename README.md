phonegap-plugin-type-helper
==========================

Now it supports Android only within Phonegap 3.

methods:

* getFile();

Installing
======
You may use phonegap CLI as follows:

<pre>
➜ phonegap local plugin add https://github.com/fiscal-cliff/phonegap-plugin-type-helper.git
[phonegap] adding the plugin: https://github.com/fiscal-cliff/phonegap-plugin-type-helper.git
[phonegap] successfully added the plugin
</pre>

Using
====
```javascript
		document.addEventListener('deviceready', onDeviceReady);
		function onDeviceReady() {
			document.body.style.background = 'red'
			window.zip = cordova.require('cordova.plugin.TypeHelper.TypeHelper');
		}
		function getFile() {
			zip.getFile(win, fail);
		}
		function win(status) {
			alert('Message: ' + status);
		}
		function fail(status) {
			alert('Error: ' + status);
		}
```
