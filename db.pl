/* define wich room contains the tresure */
treasure(room13).

/* define doors (in which room they are located, which room they lead to and which key is require to access them) */
/* starting room is room 0 */
door(room0, room1, key1).
door(room1, room6, key6).
door(room0, room1820, key18).	
door(room0, room1820, key20).	
door(room0, room7, key7).
door(room0, room1112, key11).
door(room0, room1112, key12).
door(room0, room21, key21).
door(room21, room17, key17).
door(room0, room14, key14).
door(room14, room15, key15).
door(room0, room16, key16).
door(room16, room19, key19).
door(room19, room13, key13).
door(room0, room3, key3).
door(room3, room45, key4).
door(room3, room45, key5).
door(room3, room2, key2).
door(room3, room8, key8).
door(room3, room9, key9).
door(room3, room10, key10).

/* define where the keys are (room, key) */
key(room0, key1).
key(room1, key2).
key(room1, key3).
key(room1, key21).
key(room1, key7).
key(room1, key5).
key(room1, key14).
key(room6, key8).
key(room6, key9).
key(room1820, key19).
key(room1820, key19).
key(room1112, key13).
key(room17, key20).
key(room45, key6).
key(room3, key10).
key(room3, key15).
key(room2, key4).
key(room8, key11).
key(room10, key12).
key(room16, key17).
key(room16, key18).
key(room15, key16).
