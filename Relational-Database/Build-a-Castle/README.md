# Learn Nano by Building a Castle

Nano is a program that allows you to edit files right in the terminal.

In this 40-lesson course, you will learn how to edit files in the terminal with Nano while building a castle.


There it is. Nano is a program for editing files that runs in the terminal. You can open a file with nano filename. Open the castle.sh file you created with Nano.

The terminal is showing your file in Nano. At the bottom are the commands you can use. Your file is empty right now. Add echo hello nano at the top and press control + o to "write-out", or save, the file. You will be prompted at the bottom for a filename. Leave it as castle.sh and press enter to save the file.

Exit Nano by pressing control + x.

This will be a small bash script. You can run it with bash filename. Run your castle.sh file in the terminal.

You can see the command in your file ran and output text into the terminal. Open your file again with nano.


You can "cut" text with control + k. Move the cursor to the line with your text and remove the whole line. When you are done, save the file with control + o. Note that you cannot use a mouse to move your cursor.
You are going to draw a castle that you can print to the terminal. Add echo "" to your file. Put an empty line in between the two quotes like this:
echo "

"
When you are done, save the file with control + o.
You will draw the castle between the quotes. Add ground level by putting 20 underscores (_) in the row between the quotes. It should look like this:
echo "
____________________
"
Save the file with control + o when you are done.
The ^ in front of all the commands at the bottom means to press control and the letter to run the command. Exit Nano with the Exit command.


Looks like it's working. Open your file with Nano.
Add a vertical bar, or pipe (|), at each end of your ground level. It should look like this:
|____________________|
Save the file when you are done.
Add another story to your castle above the ground level that has two more vertical bars. Each bar should be above your existing bars so you need spaces in between them. It should look like this:
|                    |
|____________________|
When you are done, save the file.
You can use control + k to "cut" and control + u to "uncut", or paste, a line. Add five more rows like the one you just added to make your castle six stories high. Try to use the cut and paste method. It should look like this:
|                    |
|                    |
|                    |
|                    |
|                    |
|____________________|
When you are done, save the file.
The existing top row is going to be the roof of the castle. Make it look like this:
|  |______________|  |
There's two spaces between the first and second bars, followed by 14 underscores (_), then a repeat of the bars and spaces. When you are done, save the file.
The M at the beginning of the other commands at the bottom stands for "meta". It's a key that doesn't exist on most keyboards. If you're on OSX it means press escape then then the letter. If you are on another system, press ALT then the letter. Use the exit command to get back to the terminal.

The top of the castle has a lookout tower on each end. Add a single row at the top of your castle to make the top look like this:
/  \              /  \
|  |______________|  |
The slashes are directly above the vertical bars. When you are done, save the file.
Add the peaks of your lookout towers. Put another row at the top with /\ above each lookout. It should look like this:
 /\                /\
/  \              /  \
When you are done, save the file.
exit nano and run script in bash
Oh no!! 😮 Looks like a storm came through and blew the roof off! I think we can fix it. Open up the file.

I'm not quite sure what happened here... Some of the \ don't seem to be working. Try adding a space after the two \ on the top right lookout tower. Put them where these x's are:
 /\                /\x
/  \              /  \x
Maybe that will patch the roof. When you are done, save the file.
Go back to the terminal so you can run the script again.

Okay, it's all patched up. Open the file again.


Add some windows to your castle. Use a left and right brackets for them ([]). Put three pairs on the fourth story, like this:
|   []    []    []   |
There's four spaces between each window and three between the window and the sides. Save the file when you are done.
Last is the door. Change the bottom two rows so there's a door right in the middle that looks like this:
|         __         |
|________|  |________|
The bottom row has two vertical bars with two spaces between them and the second story has two underscores to make the top of the door. When you are done, save the file.
Nano has a lot more features, but the basics will get you through most scenarios. Go back to the terminal with the command to exit nano.

Excellent. Open the file, I think there's one more thing you can add.

At the very top of the file, add another echo command with two quotes and an empty line between the quotes. In the empty line put the message, "Welcome to my castle". Here's an example:
echo "
message here
"
When you are done, save the file.
Go back to the terminal with the exit command so you can see if it's all done.

This is the last step. Run the script to see your final product 😄