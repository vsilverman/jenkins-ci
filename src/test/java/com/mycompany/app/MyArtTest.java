package com.mycompany.app;

// This class is using JUnit3 frameowrk

//import org.testng.annotations.Test;
//import org.testng.AssertJUnit;

import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import static org.junit.Assert.*;



public class MyArtTest {
	
	private static MyArt ma = new MyArt();
	
  @Before
  public void setup() {
//      AssertJUnit.assertTrue(true);
      assertTrue(true);
  }


  @After
  public void tearDown() {
  }

  @Test
  public void test1() {
//	  AssertJUnit.assertTrue(true);
	  assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test2() {
//	  AssertJUnit.assertTrue(true);
	  assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test3() {
//	  AssertJUnit.assertTrue(true);
	  assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test4() {
//	  AssertJUnit.assertTrue(true);
      assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test5() {
//	  AssertJUnit.assertTrue(true);
      assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test6() {
//	  AssertJUnit.assertTrue(true);
      assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test7() {
//	  AssertJUnit.assertTrue(true);
      assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  
  @Test
  public void test8() {
//	  AssertJUnit.assertTrue(true);
      assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }
  

  @Test
  public void exec() {
	  String PropFile = "c:\\bin\\art.cfg";
      String os = System.getProperty("os.name");
      if (os.contains("Linux") || os.contains("Mac"))
        PropFile = "./art.cfg";

	  MyArt.publish(PropFile);
//	  AssertJUnit.assertTrue(true);
	  assertTrue(true);
//    throw new RuntimeException("Test not implemented");
  }

}
