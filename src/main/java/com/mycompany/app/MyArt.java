package com.mycompany.app;

import java.io.File;


/**
 * -----------------------------------------------------------------------------
 * This program demonstrates the work of automated remote tool-chain (ART) framework.
 * 
 * @version 1.0
 * @author  Vlad
 * @author  (vsilverman@gmail.com)
 * -----------------------------------------------------------------------------
 *
 */
public class MyArt {
	
	private static MyProperties myProps = new MyProperties();
	private static MyCommand1 mc = new MyCommand1();
	private static String dirName = "d:\\Flash1\\SVA\\R\\V\\2016";
	private static String cmdName = "call-from-java.cmd";
	
	public static void publish(String artProps) {
		MyProperties.propsFileName = artProps;
		myProps.loadAndPrint();
		dirName = MyProperties.props.getProperty("art.folder");
		cmdName = MyProperties.props.getProperty("art.script");

		traverse(new File(dirName));
	}

    private static void processDir(File dir) {
	    if (dir != null) {
            System.out.print( (dir.isDirectory() ? "[D] : " : "[F] : "));
            System.out.println(dir);
        }
    }

    private static void traverse(File dir) {
        processDir(dir);

        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (String child : children)
                traverse(new File(dir, child));
        }
        else {
        	String fileName = dir.toString();
        	String pathSep = dependOnPlatform("\\", "/");
        	int pos = fileName.lastIndexOf(pathSep);
        	String scriptName = fileName.substring(pos + 1);
        	if (scriptName.equals(cmdName)) {
            	mc.exec(fileName);
        	}
        }
    }

    private static String dependOnPlatform(String WinValue, String LinuxValue) {
	    String res = WinValue;
        String os = System.getProperty("os.name");
        if (os.contains("Linux") || os.contains("Mac"))
            res = LinuxValue;
        return res;
    }

	/**
	 * @param args property file
	 */
	public static void main(String[] args) {
    	String PropFile = dependOnPlatform(".\\cfg\\art.cfg", "./art.cfg");

		if (args.length < 1) {
			System.out.println("Usage: java MyArt PropFile");
			System.out.println("Running demo version with default params");
		}
		else {
			PropFile = args[0];
		}

		MyArt.publish(PropFile);
	}

}
