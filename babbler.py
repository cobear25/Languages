import sys
import random

def usage():
    print >>sys.stderr, "Usage: %s <filename> [words [n]]" % sys.argv[0]
    sys.exit(1)

def main():
    n = 3
    words = 100
    if len(sys.argv) < 2 or len(sys.argv) > 4:
        usage()
    filename = sys.argv[1]
    if len(sys.argv) >= 3:
        words = int(sys.argv[2])
    if len(sys.argv) >= 4:
        n = int(sys.argv[3])
    if words < 1 or n < 2:
        usage()
    start(filename, words, n)

def start(filename, words, n):
    # get raw contents of the file
    contents = readfile(filename)

    # get list of tokens
    tokens, wordcount = tokenize(contents, n)

    # get shingles
    shingles = shingle(tokens, wordcount, n)

    # get lookup table
    table = maketable(shingles)

    #babble
    babble(random.choice(shingles), table, words)

def readfile(filename):
    fp = open(filename, 'r')
    contents = fp.read()
    fp.close()
    return contents

def tokenize(contents, n):
    tokens = []
    offset = 0
    while offset < len(contents):
        token, offset = gettoken(contents, offset)
        if token != '':
            tokens.append(token)
    wordcount = len(tokens)
    for i in range(n-1):
        tokens.append(tokens[i])
    return tokens, wordcount

#in C
def gettoken(s, offset):
    first = offset
    while first < len(s) and s[first].isspace():
        first += 1
    end = first
    while end < len(s) and not s[end].isspace():
        end += 1
    raw = s[first:end]
    token = ''
    for cha in raw:
        if cha.isalnum():
            token += cha.lower()
    return token, end


def shingle(tokens, wordcount, n):
    # get n-grams
    ngrams = []
    for i in range(wordcount):
        gram = tokens[i:i+n]
        ngrams.append(gram)
    return ngrams

def maketable(shingles):
    t = {}
    for elt in shingles:
        key = ' '.join(elt[:-1])
        suffix = elt[-1]
        if key in t:
            suffixlist = t[key]
            suffixlist.append(suffix)
        else:
            suffixlist = [suffix]
        t[key] = suffixlist
    return t

def babble(start, table, words):
    ngram = start
    for i in range(words):
        #throw away the first token
        ngram = ngram[1:]
        prefix = ' '.join(ngram)
        candidates = table[prefix]
        suffix = random.choice(candidates)
        ngram.append(suffix)

        print suffix, 

main()
