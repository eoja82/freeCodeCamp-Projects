def arithmetic_arranger(problems):
    if len(problems) > 5:
        return "Error: Too many problems."
    
    maxOperand = 4
    operators = ["+", "-"]
    probs = [x.split(" ") for x in problems]
    #print(probs)
    for x in probs:
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

        

    #return arranged_problems

#print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49", "1 + 2", "5 + 3"]))
print(arithmetic_arranger(["32 + 698", "38019 - 2999", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 698", "3801 * 2", "45 + 43", "123 + 49"]))
print(arithmetic_arranger(["32 + 688", "3801 + 2", "45 + J80", "123 + 49"]))