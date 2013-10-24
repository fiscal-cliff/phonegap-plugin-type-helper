package org.apache.cordova.plugin.TypeHelper;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.apache.cordova.*;

import android.content.Context;

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
			callbackContext.success(absolutePath);
			filePath = activity.getIntent().getDataString();

		} catch (JSONException e) {
			System.out.println("JSON exception");
			System.out.println(e.getMessage());
			return false;
		} catch (IOException e3) {
			System.out.println("IO/ZIP exception");
			System.out.println(e3.getMessage());
			return false;
		}
		System.out.println("All went fine.");
		callbackContext.success(filePath);
		return true;
	}

}
