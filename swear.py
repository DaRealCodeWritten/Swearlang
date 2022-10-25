#!/usr/bin/env python
import sys
import errors

keywords = {
    "shit": "print",
    "Shit": "input",
    "cunt": "if",
    "Cunt": "else",
}

symbols = {
    "shitter": "f",
    "fuck": "'",
    "Fuck": "\"",
    "bitch": "(",
    "Bitch": ")",
    "motherfcker": "=",
    "Motherfcker": "!",
    "bullshit": "<",
    "Bullshit": ">",
}


def replacer(string: str):
    """Find and replace all Swearlang keywords"""

    for find, replace in keywords.items():
        string = string.replace(find, replace)

    for find, replace in symbols.items():
        string = string.replace(find, replace)

    return string


if __name__ == "__main__":
    if "--file" in sys.argv:
        fileind = sys.argv.index("--file")

        try:
            filename = sys.argv[fileind+1]

            if "--interpreter-mode" in sys.argv: # Read the file line by line rather than all at once
                with open(filename) as stream:
                    for line in stream:
                        parse = replacer(line)
                        exec(parse)

                exit(0)

            with open(filename) as file:
                code = file.read()

            parsed = replacer(code)
            exec(parsed)

        except IndexError as error:
            raise errors.MissingArgumentsError("Missing file name") from error

    else: # User didn't explicitly specify a file, assume the 2nd arg is a file
        try:
            filename = sys.argv[1]

            with open(filename) as file:
                content = file.read()

            code = replacer(content)
            exec(code)

        except IndexError: # There is no 2nd arg, launch an interpreter
            while 1:
                code = input(">>> ")
                exec(replacer(code))

