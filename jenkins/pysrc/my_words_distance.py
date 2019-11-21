"""
Created on Nov 19, 2019

This program tests the function,
which finds distance between any
two words in a sentence, even if
input words are the same ones.

Distance here is interpreted as a
number of words between input words

@author: Vlad
"""
import random
import unittest


class TestDistMethods(unittest.TestCase):
    myString = "Moscow Portland Boston Sunnyvale Moscow Denver Chicago Boston Washington Miami"
    myRandomNmb = random.randint(1, 10)
    w1 = "Moscow"
    w2 = "Sunnyvale"

    def find_distance(self):
        words = self.myString.split(" ")
        i1 = -1
        i2 = -1
        for i in range(len(words)):
            if i1 == -1 and words[i] == self.w1:
                i1 = i
            else:
                if i2 == -1 and words[i] == self.w2:
                    i2 = i
        distance = i2 - i1 - 1
        print ("distance between <" + str(self.w1) + "> and <" + str(self.w2) + "> is " + str(distance))
        return distance

    @classmethod
    def setUpClass(cls):
        # This method is called before tests in an individual class are run
        print ("Test String: " + cls.myString + "\n")

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        pass
        # Method called to prepare the test fixture.
        # This is called immediately before calling the test method

    def tearDown(self):
        pass

    def test_case_1(self):
        # this test_case uses default data for testing
        d = self.find_distance()
        self.assertEqual(2, d, "Distance is incorrect")

    def test_case_2(self):
        self.w1 = "Moscow"
        self.w2 = "Moscow"
        d = self.find_distance()
        self.assertEqual(3, d, "Distance is incorrect")

    def test_case_3(self):
        self.w1 = "Boston"
        self.w2 = "Boston"
        d = self.find_distance()
        self.assertEqual(4, d, "Distance is incorrect")

    def test_case_4(self):
        self.w1 = "Boston"
        self.w2 = "Washington"
        d = self.find_distance()
        self.assertEqual(5, d, "Distance is incorrect")

    def test_case_5(self):
        self.w1 = "Moscow"
        self.w2 = "Miami"
        d = self.find_distance()
        self.assertEqual(8, d, "Distance is incorrect")


if __name__ == '__main__':
    # function below will be executed only
    # if we run this program as a script,
    # i.e. - "python my_files.py"
    unittest.main()
