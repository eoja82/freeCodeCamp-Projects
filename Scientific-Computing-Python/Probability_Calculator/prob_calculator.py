import copy
import random
# Consider using the modules imported above.

class Hat:
    def __init__(self, **kwargs):
        self.contents = []
        for k, v in kwargs.items():
            for i in range(v):
                self.contents.append(k)
        #print(self.contents)
    
    def draw(self, balls):
        drawnBalls = []
        if balls >= len(self.contents): return self.contents
        while balls > 0:
            contents = copy.deepcopy(self.contents)
            pick = random.randrange(0, len(contents))
            drawnBalls.append(self.contents[pick])
            contents.pop(pick)
            balls -= 1
        return drawnBalls


def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    M = 0
    experiments = num_experiments
    #print(expected_balls, type(expected_balls))
    while num_experiments > 0:
        drawnBalls = hat.draw(num_balls_drawn)
        #print(drawnBalls)
        match = True
        for k, v in expected_balls.items():
            drawn = drawnBalls.count(k)
            if drawn < v:
                match = False
                break
        if match:
            M += 1
            #print("match")
        num_experiments -= 1
    return M / experiments

hat = Hat(blue=4, red=2, green=6)
probability = experiment(
    hat=hat,
    expected_balls={"blue": 2,
                    "red": 1},
    num_balls_drawn=4,
    num_experiments=3000)
print("Probability:", probability)