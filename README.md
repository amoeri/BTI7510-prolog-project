# BTI7510-prolog-project
Final project for Artificial Intelligence lecture BTI7510 at BFH

## Puzzle
The goal of this project was to solve following puzzle
![puzzle](puzzle.png)
Where it is the agents goal to find the treasure by mobinf from room to room through the doors.
To open the door N the corresponding key N is required. Keys can be picked up when the agent is in the same room as the key.

## Method
A prolog program was implemented in three parts:

`db.pl` contains a representation of the puzzle, where `treasure(ROOM)` denotes in which ROOM the treasure is located, `door(ROOMX, ROOMY, KEYY)` describes that there is a door from ROOMX to ROOMY that can be opened with KEYY and `key(ROOM, KEY)` indicates that KEY can be found in ROOM.

`solve.pl` contains the logic to solve the puzzle. At every time there are three possible types of steps or actions that the agent can take:
- Finding the treasure
- Switching rooms
- Picking up a key
Thus there are three definition of `step()`.
While solving, we keep track of which room the agent is in, which keys have been picked up, which rooms have been visited (to avoid loops) and a log of the previous steps.

`run.pl` allows for easy execution of the solver and can be for example run like this `swipl -s run.pl`

## Solution
Our programs outputs a valid solution:
```
Pick up key1 in room0
Switch from Room room0 to Room room1
Pick up key2 in room1
Pick up key3 in room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room3
Switch from Room room3 to Room room2
Pick up key4 in room2
Switch from Room room2 to Room room3
Switch from Room room3 to Room room45
Pick up key6 in room45
Switch from Room room45 to Room room3
Switch from Room room3 to Room room0
Switch from Room room0 to Room room1
Switch from Room room1 to Room room6
Pick up key8 in room6
Switch from Room room6 to Room room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room3
Switch from Room room3 to Room room8
Pick up key11 in room8
Switch from Room room8 to Room room3
Switch from Room room3 to Room room0
Switch from Room room0 to Room room1
Switch from Room room1 to Room room6
Pick up key9 in room6
Switch from Room room6 to Room room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room1112
Pick up key13 in room1112
Switch from Room room1112 to Room room0
Switch from Room room0 to Room room1
Pick up key21 in room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room3
Pick up key10 in room3
Switch from Room room3 to Room room10
Pick up key12 in room10
Switch from Room room10 to Room room3
Switch from Room room3 to Room room0
Switch from Room room0 to Room room1
Pick up key7 in room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room3
Pick up key15 in room3
Switch from Room room3 to Room room0
Switch from Room room0 to Room room1
Pick up key5 in room1
Pick up key14 in room1
Switch from Room room1 to Room room0
Switch from Room room0 to Room room14
Switch from Room room14 to Room room15
Pick up key16 in room15
Switch from Room room15 to Room room14
Switch from Room room14 to Room room0
Switch from Room room0 to Room room16
Pick up key17 in room16
Switch from Room room16 to Room room0
Switch from Room room0 to Room room21
Switch from Room room21 to Room room17
Pick up key20 in room17
Switch from Room room17 to Room room21
Switch from Room room21 to Room room0
Switch from Room room0 to Room room1820
Pick up key19 in room1820
Switch from Room room0 to Room room16
Switch from Room room16 to Room room19
Switch from Room room19 to Room room13
Treasure found in room13
```
