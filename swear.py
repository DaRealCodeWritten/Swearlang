#!/usr/bin/env python
import sys
from errors import errors


keywords = {
    "shit ": "print",
    "Shit ": "input",
    "cunt": "if",
    "Cunt": "else",
}
symbols = {
    "fuck ": "'",
    "Fuck ": "\"",
    "bitch ": "(",
    "Bitch ": ")",
    "motherfucker": "=",
    "Motherfucker": "!",
    "bullshit": "<",
    "Bullshit": ">",
}


if "--file" in sys.argv:
    fileind = sys.argv.index("--file")
    try:
        filename = sys.argv[fileind+1]
        with open(filename) as file:
            code = file.read()
        for find, replace in keywords.items():
            code = code.replace(find, replace)
        for find, replace in symbols.items():
            code = code.replace(find, replace)
        eval(code)
    except IndexError as error:
        raise errors.MissingArgumentsError("Missing file name") from error
