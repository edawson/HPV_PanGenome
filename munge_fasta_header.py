import sys
import re

def hpv_name(r):
    patt = re.compile("HPV[0-9a-z]*")
    if re.search("HPV[0-9a-z]*", r) is not None:
        return re.search("HPV[0-9a-z]*", r).group(0)
    else:
        return None

def type_name(r):
    if re.search("type [0-9a-zA-Z]*", r) is not None:
        return re.search("type [0-9a-zA-Z]*", r).group(0)
    else:
        return None

def grep_name(r):
        if "complete genome" in r:
            return r
        else:
            return ""

if __name__ == "__main__":

    rec_d = {}

    rec = ""
    for line in sys.stdin:
        if line.startswith(">"):
            rec = line.strip().strip(">")
            rec_d[rec] = ""
        elif line.startswith("\n"):
            continue
        else:
            rec_d[rec] += line.strip()

    for r in rec_d:
        #k = hpv_name(r)
        k = type_name(r)
        if k is not None:
            print ">", k, "\n", rec_d[r]
