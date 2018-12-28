# -*- coding: utf-8 -*-
import unittest
import JokeOfTheDay


class JokeOfTheDayTest(unittest.TestCase):
    def setUp(self):
        # setUp() will be executed before every of 3 tests, defined below
        self.verificationErrors = []
        self.accept_next_alert = True
        self.joke = JokeOfTheDay.get_random_joke()

    def test1(self):
        self.assertTrue(self.joke.startswith("This"))

    def test2(self):
        self.assertTrue("#" in self.joke)

    def test3(self):
        self.assertTrue(self.joke is not None)

    def tearDown(self):
        self.assertEqual([], self.verificationErrors)


if __name__ == "__main__":
    unittest.main()
