import sys       
import subprocess
import re

# Calls the R system specifying that commands come from file commands.R
# The commands.R provided with this assignment will read the file named
# data and will output a histogram of that data to the file pageshist.pdf
def runR( ):
    res = subprocess.call(['R', '-f', 'commands.R'])

# log2hist analyzes a log file to calculate the total number of pages
# printed by each user during the period represented by this log file,
# and uses R to produce a pdf file pageshist.pdf showing a histogram
# of these totals.  logfilename is a string which is the name of the
# log file to analyze.
#
def log2hist(logfilename):
	file = open(logfilename)
	users = {}
	for string in file:
		regex = re.search('user:\s+(?P<user>.*?)\s+.*?pages:\s+(?P<pages>\d+)\s*', string)
		if regex:
			name = regex.group('user')
			count = int(regex.group('pages'))
			if name in users:
				users[name] += count
			else:
				users[name] = count
	data = open('data', 'w+')
	for count in users.values():
		data.write('%d\n' % count)
	data.close()
	file.close()
	runR()
	return

if __name__ == '__main__':
    log2hist(sys.argv[1])   # get the log file name from command line

# line above may be changed to log2hist("log") to make the file name
#    always be log

