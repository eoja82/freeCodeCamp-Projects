class Category:
    def __init__(self, catagory):
        self.catagory = catagory.capitalize()
        self.ledger = []
    
    def deposit(self, amount, *description):
        self.ledger.append({"amount": amount, "description": description[0] if description else ""})
    
    def get_balance(self):
        total = 0
        if len(self.ledger) > 0:
            for x in self.ledger:
                total = total + x["amount"]
        return total
    
    def check_funds(self, amount):
        total = 0
        if len(self.ledger) > 0:
            for x in self.ledger:
                total = total + x["amount"]
        if amount > total:
            return False
        else:
            return True
    
    def withdraw(self, amount, *description):
        if self.check_funds(amount):
            self.ledger.append({"amount": -amount, "description": description[0] if description else ""})
            return True
        else:
            return False
    
    def transfer(self, amount, catagory):
        if self.check_funds(amount):
            self.withdraw(amount, "Transfer to " + catagory.catagory)
            catagory.deposit(amount, "Transfer from " + self.catagory)
            return True
        else:
            return False

    def __str__(self):
        total = f"{self.get_balance():.2f}"
        string = self.catagory.center(30, "*") + "\n"

        if len(self.ledger) > 0:
            for x in self.ledger:
                desc = x["description"] if len(x["description"]) <= 23 else x["description"][0:23]
                amt = x["amount"]
                amt = f"{amt:.2f}"
                if len(amt) > 7:
                    amt = amt[0:7]
                string = string + desc + amt.rjust(30 - len(desc)) + "\n"

        string = string + "Total: " + total
        
        return string

def create_spend_chart(categories):
    chart = "Percentage spent by category\n"
    grid = {100: "100| ", 90: " 90| ", 80: " 80| ", 70: " 70| ", 60: " 60| ", 50: " 50| ", 40: " 40| ", 30: " 30| ", 20: " 20| ", 10: " 10| ", 0: "  0| "}
    totalSpent = 0
    spentInEachCat = []
    gridKeys = []
    
    for cat in categories:
        spent = 0
        for x in cat.ledger:
            if x["amount"] < 0:
                totalSpent += abs(x["amount"])
                spent += abs(x["amount"])
        spentInEachCat.append(spent)
        gridKeys.append(cat.catagory)
    spentInEachCat = [round((x / totalSpent) * 100) for x in spentInEachCat]
    
    for ave in spentInEachCat:
        for k, v in grid.items():
            if ave >= k:
                grid[k] = grid[k] + "o  "
            else:
                grid[k] = grid[k] + "   "
    
    for k, v in grid.items():
        chart = chart + v + "\n"
    chart = chart + "    -" + ("-" * (3 * len(categories))) + "\n"

    longestGridKey = 0
    for x in gridKeys:
        if len(x) > longestGridKey:
            longestGridKey = len(x)

    for i in range(longestGridKey):
        line = "     "
        for key in gridKeys:
            try:
                line = line + key[i] + "  "
            except:
                line = line + "   "
        chart = chart + line
        if i < longestGridKey - 1:
            chart = chart + "\n"

    return chart

# for development testing
""" food = Category("Food")
food.deposit(50)
food.deposit(50, "money")
food.withdraw(25, "groceries")
food.withdraw(250, "groceries")
clothing = Category("Clothing")
clothing.deposit(45, "deposit")
clothing.deposit(20000, "putting lots of money in with long description")
food.transfer(1000, clothing)
food.transfer(10, clothing)
clothing.withdraw(25, "new shoes")
shoes = Category("shoes")
#print(shoes)
print(create_spend_chart([shoes, food, clothing])) """