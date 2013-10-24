package org.apache.cordova.plugin.TypeHelper;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;

/**
 * @author Evgeniy Lukovsky
 *
 */
public class TypeHelperPlugin extends CordovaPlugin {
	public enum Action{
		getFile
	}


	/* (non-Javadoc)
	 * @see org.apache.cordova.CordovaPlugin#execute(java.lang.String, org.json.JSONArray, org.apache.cordova.CallbackContext)
	 */
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		System.out.println("plugin has been started");
		boolean result = false;

		switch(Action.valueOf(action)){
		case getFile: result = true;
			getFile(args, callbackContext);
			break;
		}
		return result;
	}

	/**
	 * @param args
	 * @param callbackContext
	 * @return
	 */
	private boolean getFile(JSONArray args, CallbackContext callbackContext) {
		String filePath = null;
		try {
			Activity activity = cordova.getActivity();
			filePath = activity.getIntent().getDataString();
			callbackContext.success(filePath);

		} catch (NullPointerException e) {
			System.out.println("Null pointer exception");
			System.out.println(e.getMessage());
			return false;
		}
		System.out.println("All went fine.");
		callbackContext.success(filePath);
		return true;
	}

}
