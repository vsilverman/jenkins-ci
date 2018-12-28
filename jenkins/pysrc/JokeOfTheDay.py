"""
Created on Feb 25, 2018


@author: Vlad
"""

import os
import random


def get_random_joke():
	"""
	This function prints a single
	random joke from a list of jokes,
	contained in the "jokes.txt" file

	To run this function from other module
	include in that module following lines:
		import jokeOfTheDay
		JokeOfTheDay.get_random_joke()
	"""
	filename = "jokes.txt"
	# check if file exists
	if not os.path.exists(filename):
		print("file " + filename + " does not exist")
		quit()
	# read file into list of lines
	text_file = open(filename, "r")
	lines = text_file.readlines()
	# find the number of lines in file
	nmblines = len(lines)
	# generate random int number in defined range
	rand = random.randint(0, nmblines-1)
	# print random number and close file
	line = lines[rand]
	print (line)
	text_file.close()
	return line


def main():
	if __name__ == '__main__':
		get_random_joke()


main()
