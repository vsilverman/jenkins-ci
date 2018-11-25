package stepdefs;

//import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.Assert;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.api.PendingException;

import java.util.concurrent.TimeUnit;

//import static org.hamcrest.CoreMatchers.*;

/* -----------------------------------------------------------------------------
 * This program demonstrates data-driven automation of
 * trusted authentication to https://localhost:8080
 * domain using existing jenkins demo account.
 * After login into jenkins with demo credentials it tests
 * validity of those values by verifying UI authentication.
 * To perform testing this demo is using cucumber framework.
 *
 * @version 1.0
 * @author  Vlad
 * -----------------------------------------------------------------------------
 */

public class LoginTest {
    private WebDriver driver;
    private String baseUrl = "http://localhost:8080";
    private String os = System.getProperty("os.name");

//    @Before
//    public void setUp() throws Exception {
//        if (os.contains("Linux"))
//            return;
//        System.setProperty("webdriver.chrome.driver", "chromedriver");
//        driver = new ChromeDriver();
//        driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
//        driver.get(baseUrl);
//    }

//    @Given("I am on the {string} page on URL {string}")
//    public void i_am_on_the_page_on_URL(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        System.setProperty("webdriver.chrome.driver", "chromedriver");
//        driver = new ChromeDriver();
//        driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
//        driver.get(baseUrl);
//        throw new cucumber.api.PendingException();
//    }

//    @Then("I should see {string} button")
//    public void i_should_see_button(String string) {
//        // Write code here that turns the phrase above into concrete actions
//        String exp_message = "Welcome to Jenkins";
//        String actual = driver.findElement(By.cssSelector(".info-account")).getText();
//        throw new cucumber.api.PendingException();
//    }

    @Given("^user is on home page$")
    public void user_is_on_home_page() throws Throwable {
        if (os.contains("Linux"))
            return;
        System.setProperty("webdriver.chrome.driver", "chromedriver");
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
        driver.get(baseUrl);
//        throw new PendingException();
    }


    @When("^user correctly logins$")
    public void user_correctly_logins() throws Throwable {
        if (os.contains("Linux"))
            return;
        driver.findElement(By.id("j_username")).clear();
        driver.findElement(By.id("j_username")).sendKeys("demo");
        driver.findElement(By.name("j_password")).clear();
        driver.findElement(By.name("j_password")).sendKeys("demo");
        driver.findElement(By.name("Submit")).click();
//        throw new PendingException();
    }


    @Then("^user is authenticated$")
    public void user_is_authenticated() throws Throwable {
        if (os.contains("Linux"))
            return;
        WebElement element = driver.findElement(By.id("jenkins-name-icon"));
        Assert.assertTrue(element.isDisplayed());
        element.click();
//        driver.quit();
    }



    @After
    public void tearDown() throws Exception {
        if (os.contains("Linux"))
            return;
        driver.quit();
    }


//    private boolean isElementPresent(By by) {
//        try {
//            driver.findElement(by);
//            return true;
//        } catch (NoSuchElementException e) {
//            return false;
//        }
//    }

}
