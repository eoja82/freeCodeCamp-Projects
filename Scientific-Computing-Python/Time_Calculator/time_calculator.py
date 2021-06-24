import re
import math

def add_time(start, duration, *day):
    start = re.split(":|\s", start)
    start[0] = int(start[0])
    start[1] = int(start[1])
    #print(start)
    duration = duration.split(":")
    duration[0] = int(duration[0])
    duration[1] = int(duration[1])
    #print(duration)
    hours = start[0] + duration[0]
    if start[2] == "PM":
        hours += 12
    minutes = start[1] + duration[1]
    if minutes >= 60:
        hours += 1
        minutes = minutes - 60
    minutes = "0" + str(minutes) if minutes < 10 else str(minutes)
    ampm = "AM"
    days = math.floor(hours / 24)
    hours = hours % 24
    if hours == 0:
        hours = "12"
    elif hours > 12:
        ampm = "PM"
        hours = str(hours - 12)
    else:
        hours = str(hours)
    
    print(hours, minutes, ampm, days)

# for development testing
add_time("3:00 PM", "3:10")              # Returns: 6:10 PM
add_time("11:30 AM", "2:32", "Monday")   # Returns: 2:02 PM, Monday
add_time("11:43 AM", "00:20")            # Returns: 12:03 PM
add_time("10:10 PM", "3:30")             # Returns: 1:40 AM (next day)
add_time("11:43 PM", "24:20", "tueSday") # Returns: 12:03 AM, Thursday (2 days later)
add_time("6:30 PM", "205:12")            # Returns: 7:42 AM (9 days later)