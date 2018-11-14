package com.mycompany.app;

/**
 * 
 */
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;



/**
 * @author Vlad
 *
 */
public class MyProperties {
	
	public static Properties props = new Properties();
	public static String propsFileName = "art.cfg";
	
	public void loadAndPrint() {
		try {
			props.load(new FileInputStream(propsFileName));

			System.out.println("*** unsorted properties list ***");
			props.list(System.out);
			
			System.out.println("\n*** sorted properties list ***");
			Set<Object> keys = props.keySet();
			Set<Object> sortedKeys = new TreeSet<Object>(keys);
			Iterator<Object> i = sortedKeys.iterator();
			String key;
			while (i.hasNext()) {
				key = i.next().toString();
				System.out.println(key + " : " + props.getProperty(key));
			}
			
		}
		catch (IOException ioe) {
			ioe.getStackTrace();
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		if (args.length < 1) {
			System.out.println("Usage:  java MyProperties <propsFileName>");
		}
		else {
			propsFileName = args[0];
		}
		
		MyProperties myProps = new MyProperties();
		myProps.loadAndPrint();
	}

}
