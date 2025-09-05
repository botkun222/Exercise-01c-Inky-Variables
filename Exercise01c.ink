/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/



VAR pet_name = ""     
VAR torches = 0       
VAR health = 5        
VAR money = 0         
VAR level = 1         

-> memory

== memory ==
Before you stands the cavern of Josh. You wish to name your childhood pet. 
=[Charlie] 
~ pet_name = "Charlie"
-> cave_mouth 
[Susan] 
~ pet_name = "Susan"
-> cave_mouth 
[Spot] 
~ pet_name = "Spot"
-> cave_mouth 

== cave_mouth ==
You are at the entrance of a cave. {not torch_pickup: |There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now.

You have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* {not torch_pickup} [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark; you can't see anything.
= (torches > 0) [Light Torch] -> east_tunnel_lit 
+ [Go back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. The air is damp, and the walls are slick with moisture. A faint draft blows from deeper within.
+ [Explore deeper] -> underground_lake
+ [Go back] -> cave_mouth
-> END

== torch_pickup ==
You now have a torch. May it light the way.
~ torches = torches + 1
* [Go back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off thousands of coins scattered across the floor. A narrow passage leads north.
+ [Take the north passage] -> treasure_room
+ [Go back] -> east_tunnel
-> END

== underground_lake ==
You reach an underground lake. The water is eerily still, and you see something shimmering on a small island.
+ [Swim across] -> hidden_island
+ [Head back] -> west_tunnel
-> END

== hidden_island ==
You swim to a small island in the lake. An old man sits by a campfire, but when he sees you, his eyes blaze with hatred.  
He pulls a jagged dagger from his cloak and snarls: *“You should never have come here. Now you die.”*
+ [Stake down the old man] -> old_man_staked
+ [Speak with him] -> old_man_attacks_you
-> END

== old_man_staked ==
You drive a sharpened stake into the old man’s chest. He lets out a terrible cry before collapsing into the sand.  
~ level = level + 1
Among his torn robes, you discover a weathered map showing the way to a hidden **treasure room**.  
+ [Follow the map to the treasure room] -> treasure_room
-> END

== old_man_attacks_you ==
The old man lunges forward and slashes you with his dagger!  
~ health = health - 3
You lose 3 health. You now have {health} health left.  

The wound is painful, but you are still alive.  
What will you do?  

+ [Swim away to safety] -> swim_away
+ [Attack back with all your strength] -> fight_back
+ [Still refuse to fight] -> refuse_again

== swim_away ==
You dive into the cold water and swim desperately back to the shore.  
Breathing hard, you collapse on the rocky bank of the underground lake.  
-> underground_lake

== fight_back ==
Summoning your remaining strength, you strike at the old man.  
He staggers backward, his dagger clattering to the ground.  
Among his torn robes, you discover a weathered map showing the way to a hidden **treasure room**.  
+ [Follow the map to the treasure room] -> treasure_room
-> END

== refuse_again ==
You lower your hands once more, hoping for mercy.  
The old man’s eyes blaze with fury. With a sudden lunge, he strikes you again!  
~ health = health - 3
You lose 3 more health. You now have {health} health left.  

{health <= 0:
    The second wound is fatal. Darkness takes you.  
    -> END
}

== treasure_room ==
You enter a small chamber. Piles of gold and silver surround a stone pedestal. The treasure is yours for the taking.  

+ [Leave with the treasure] -> take_treasure
+ [Leave quietly, taking nothing] -> east_tunnel_lit
-> END

== take_treasure ==
~ money = money + 5000
You take the treasure and now have {money} gold coins.  
-> victory

== victory ==
With your arms full of gold and jewels, you make your way back to the cave mouth.  
The sunlight warms your face as you step into the open air — rich beyond your wildest dreams.  
**You win!**
-> END
