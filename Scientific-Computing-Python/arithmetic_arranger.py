def arithmetic_arranger(problems, *printAnswer):
    if len(problems) > 5:
        return "Error: Too many problems."
    
    def getAnswer(x):
        if x[1] == "+":
            return str(int(x[0]) + int(x[2]))
        else:
            return str(int(x[0]) - int(x[2]))
    
    operators = ["+", "-"]
    problems = [x.split(" ") for x in problems]
    
    for x in problems:
        if len(x[0]) > 4 or len(x[2]) > 4:
            return "Error: Numbers cannot be more than four digits."
        if not x[1] in operators:
            return "Error: Operator must be '+' or '-'."
        for char in x[0]:
            if ord(char) < 48 or ord(char) > 57:
                return "Error: Numbers must only contain digits."
        for char in x[2]:
            if ord(char) < 48 or ord(char) > 57:
                return "Error: Numbers must only contain digits."
        numDashes = max(len(x[0]), len(x[2])) + 2
        dashes = list("_") * numDashes
        x.append("".join(dashes))
        x.append(getAnswer(x))
        
    #print(problems)
    result = ""

    for i in range(4):
        if i == 0:
            for x in problems:
                result = result + (" " * (len(x[3]) - len(x[0]))) + x[0] + "    "
            result = result + "\n"
        if i == 1:
            for x in problems:
                spaces = len(x[0]) - len(x[2]) if len(x[0]) > len(x[2]) else 0
                result = result + x[1] + " " + (" " * spaces) + x[2] + "    "
            result = result + "\n"
        if i == 2:
            continue
        if i == 3:
            for x in problems:
                result = result + x[3] + "    "
            if printAnswer:
                result = result + "\n"
                for x in problems:
                    spaces = len(x[3]) - len(x[4])
                    result = result + (" " * spaces) + x[4] + "    "
        
    return result
    #return arranged_problems

print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49"], True))
print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49", "1 + 2", "5 + 3"]))
print(arithmetic_arranger(["32 + 698", "38019 - 2999", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 698", "3801 * 2", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 688", "3801 + 2", "45 + J80", "123 + 49"]))