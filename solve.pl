/* 
Each step has to know 
- which ROOM you are in
- what KEYS have been picked up so far
- LOG of previous steps and where to pass the NEW_LOG
- which ROOMS have been visited so far including the new one in NEW_ROOMS (to avoid loops)
*/

/* Check wether treasure is in current room, if so we are done (print log) */
step(ROOM, _, LOG, NEW_LOG, ROOMS, NEW_ROOMS) :-
	treasure(ROOM),
	string_concat("Treasure found in ", ROOM, LINE),
	append(LOG, [LINE], NEW_LOG),
	append(ROOMS, [], NEW_ROOMS),
	print_log(NEW_LOG).

/* Go to next available room */
step(ROOM, KEYS, LOG, NEW_LOG, ROOMS, NEW_ROOMS) :-
	switchRoom( ROOM,KEYS,NEW_ROOM, LOG, LOG_TEMP, ROOMS, ROOMS_TEMP),
	step( NEW_ROOM, KEYS, LOG_TEMP, NEW_LOG, ROOMS_TEMP, NEW_ROOMS).

/* Pick up keys */
step(ROOM, KEYS, LOG, NEW_LOG, ROOMS, NEW_ROOMS) :-
	pickupKey(ROOM, KEYS, NEW_KEYS, LOG, LOG_TEMP, ROOMS, ROOMS_TEMP),
	step( ROOM, NEW_KEYS, LOG_TEMP, NEW_LOG, ROOMS_TEMP, NEW_ROOMS).

/* switch from one room to another if the door is accessible and you have the key */
switchRoom(ROOM, KEYS, NEW_ROOM, LOG, NEW_LOG, ROOMS, NEW_ROOMS) :-
	has_door(ROOM, NEW_ROOM, KEY),
	member(KEY, KEYS),
	not(member(NEW_ROOM, ROOMS)),
	string_concat("Switch from ", ROOM, LINE2),
	string_concat(LINE2, " to ", LINE3),
	string_concat(LINE3, NEW_ROOM, LINE4),
	append(LOG, [LINE4], NEW_LOG),
	append(ROOMS, [NEW_ROOM], NEW_ROOMS).

/* pickup keys if you are in correct room and don't have key yet */
pickupKey(ROOM, KEYS, NEW_KEYS, LOG, NEW_LOG, _, NEW_ROOMS) :-
	key(ROOM,ROOM_KEY),
	not(member(ROOM_KEY, KEYS)),
	append(KEYS, [ROOM_KEY], NEW_KEYS),
	atomic_concat("Pick up ", ROOM_KEY, LINE2),
	string_concat(LINE2, " in ", LINE3),
	string_concat(LINE3, ROOM, LINE4),
	append(LOG, [LINE4], NEW_LOG),
	append([], [ROOM], NEW_ROOMS).

/* make doors passable in both directions */	
has_door(FROM, TO, KEY) :- door(FROM, TO, KEY).
has_door(FROM, TO, KEY) :- door(TO, FROM, KEY).

/* print log */
print_log([]).
print_log([LINE | LOG]) :-
	write(LINE), write("\n"),
	print_log(LOG).
