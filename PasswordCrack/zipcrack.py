import zipfile
from time import time
import sys




def usage():
    print sys.argv[0], " secretfile passwordfile"


def main():
    secret_file = sys.argv[1]
    password_file = sys.argv[1]
    try:
        myZip = zipfile.ZipFile(secret_file)
    except zipfile.BadZipfile:
        print "[!] There was an error opening your zip file."
        return

    password = ''
    
    timeStart = time()
    with open(password_file, "r") as f:
        passes = f.readlines()
        for pass_count, x in enumerate(passes):
            password = x.strip()
            try:
                myZip.extractall(pwd = password)
                totalTime = time() - timeStart
                print "\nPassword cracked: %s\n" % password
                print "%i password attempts per second." % (pass_count/totalTime)
                return
            except Exception as e:
                if str(e[0]) == 'Bad password for file':
                    pass # TODO: properly handle exceptions?
                elif 'Error -3 while decompressing' in str(e[0]):
                    pass # TODO: properly handle exceptions?
                else:
                    print e
        print "Sorry, password not found."

if __name__ == '__main__':
        if len(sys.argv) < 3:
            usage()
        else:
	    main()
# https://www.doyler.net/security-not-included/python-zip-password-cracker
