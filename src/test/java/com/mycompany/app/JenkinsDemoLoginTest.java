package com.mycompany.app;

//import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;

import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import static org.junit.Assert.*;
//import static org.hamcrest.CoreMatchers.*;

import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

/* -----------------------------------------------------------------------------
 * This program demonstrates data-driven automation of
 * trusted authentication to https://localhost:8080
 * domain using existing jenkins demo account.
 * After login into jenkins with demo credentials it tests
 * validity of those values by verifying UI authentication.
 *
 * @version 1.0
 * @author  Vlad
 * -----------------------------------------------------------------------------
 */

public class JenkinsDemoLoginTest {
    private WebDriver driver;
    private String baseUrl = "http://localhost:8080";

    @Before
    public void setUp() throws Exception {
        System.setProperty("webdriver.chrome.driver", "/home/jenkins-ci/chromedriver");
//        driver = new FirefoxDriver();
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        driver.get(baseUrl);
    }

    @Test
    public void testDemoLoginAction() throws Exception {
        driver.get("http://localhost:8080/login?from=%2F");
        driver.findElement(By.id("j_username")).clear();
        driver.findElement(By.id("j_username")).sendKeys("demo");
        driver.findElement(By.name("j_password")).clear();
        driver.findElement(By.name("j_password")).sendKeys("demo");
        driver.findElement(By.name("Submit")).click();
    }

    @Test
    public void testLoginName() throws Exception {
        String LoginName = "j_username";
        assertTrue(isElementPresent(By.id(LoginName)));
    }

    @Test
    public void testLoginPassword() throws Exception {
        String LoginPassword = "j_password";
        assertTrue(isElementPresent(By.name(LoginPassword)));
    }

    @Test
    public void testSubmitButton() throws Exception {
        String SubmitButton = "Submit";
        assertTrue(isElementPresent(By.name(SubmitButton)));
    }


    @After
    public void tearDown() throws Exception {
        driver.quit();
    }


    private boolean isElementPresent(By by) {
        try {
            driver.findElement(by);
            return true;
        } catch (NoSuchElementException e) {
            return false;
        }
    }

}
