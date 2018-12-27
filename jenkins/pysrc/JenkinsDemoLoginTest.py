# -*- coding: utf-8 -*-
import unittest
from selenium import webdriver
# import selenium.webdriver.chrome.service as service
from selenium.common.exceptions import NoAlertPresentException
from selenium.common.exceptions import NoSuchElementException


class JenkinsDemoLogin(unittest.TestCase):
    def setUp(self):
        # self.driver = webdriver.Chrome("/var/jenkins_home/workspace/Jenkins-BlueOcean/chromedriver")
        # passing above parameter inside webdriver.Chrome() is optional
        self.driver = webdriver.Chrome()
        self.driver.implicitly_wait(30)

        # service = service.Service('./chromedriver')
        # service.start()
        # capabilities = {'chrome.binary': '/path/to/custom/chrome'}
        # driver = webdriver.Remote(service.service_url, capabilities)

        self.base_url = "https://www.katalon.com/"
        self.verificationErrors = []
        self.accept_next_alert = True

    def test_jenkins_demo_login(self):
        driver = self.driver
        driver.get("http://localhost:8080/login?from=%2F")
        driver.find_element_by_id("j_username").clear()
        driver.find_element_by_id("j_username").send_keys("demo")
        driver.find_element_by_name("j_password").clear()
        driver.find_element_by_name("j_password").send_keys("demo")
        driver.find_element_by_name("Submit").click()
        driver.find_element_by_id("jenkins-name-icon").click()

    def is_element_present(self, how, what):
        try:
            self.driver.find_element(by=how, value=what)
        except NoSuchElementException as e:
            return False
        return True

    def is_alert_present(self):
        try:
            self.driver.switch_to_alert()
        except NoAlertPresentException as e:
            return False
        return True

    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally:
            self.accept_next_alert = True

    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)


if __name__ == "__main__":
    unittest.main()
