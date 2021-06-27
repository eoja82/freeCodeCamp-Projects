import copy
import random
# Consider using the modules imported above.

class Hat:
    def __init__(self, **kwargs):
        self.contents = []
        for k, v in kwargs.items():
            for i in range(v):
                self.contents.append(k)
    
    def draw(self, balls):
        drawnBalls = []
        if balls >= len(self.contents): return self.contents
        
        while balls > 0:
            pick = random.randrange(0, len(self.contents))
            drawnBalls.append(self.contents[pick])
            self.contents.pop(pick)
            balls -= 1
        
        return drawnBalls


def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    M = 0
    experiments = num_experiments

    while num_experiments > 0:
        drawnBalls = copy.deepcopy(hat).draw(num_balls_drawn)
        match = True

        for k, v in expected_balls.items():
            drawn = drawnBalls.count(k)
            if drawn < v:
                match = False
                break
        
        if match:
            M += 1
        num_experiments -= 1

    return M / experiments