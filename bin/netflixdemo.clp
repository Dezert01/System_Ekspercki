(deffacts messages
      (msg0 "What Movie to Watch on Netflix - Expert System;Start;start2")
      (msg1 "Want your night to be action packed?;yes;no;action")
      (msg2 "Have you seen The Terminator?;yes;no;terminator")
      (msg3 "What about a documentary?;yes;no;documentary")
      (msg4 "How about a war movie?;yes;no;war")
      (msg5 "Horses, boots and 10-gallon hats?;yes;no;horses")
      (msg6 "You want to go oldschool or keep it fresh?;old;fresh;oldschool")
      (msg7 "Do you want to keep it serious?;yes;no;serious")
      (msg8 "Set in the future or present day?;future;now;future")
      (msg9 "Do you consider snowboard films to be documentaries?;yes;no;snowboard")
      (msg10 "Do you want to have your face melted off from maximum rock?;yes;no;facemelted")
      (msg11 "Take it to the streets?;yes;no;streets")
      (msg12 "Pain or Paint?;pain;paint;painorpaint")
      (msg13 "Do you want to see just how ridiculous religion can be?;yes;no;religion")
      (msg14 "Are you a Woody Allen fan? Or would you like to become one?;yes;no;woodyallenfan")
      (msg15 "Do subtitles bother you?;yes;no;subtitles")
      (msg16 "Monsters, murderers and madness?;yes;no;monsters")
      (msg17 "Should there be a blood-soaked chainsaw at some point?;yes;no;chainsaw")
      (msg18 "Three parts classic horror, one part something new?;yes;no;classichorror")
      (msg19 "Do abandoned asylums scare the sense out of you?;yes;no;asylums")
      (msg20 "Are you in the mood to laugh?;yes;no;laughmood")
      (msg21 "Do you want some drama with your laughter?;yes;no;drama")
      (msg22 "Do you mind it when people break out singing?;yes;no;singing")
      (msg23 "Do you find clever wordplay entertaining?;yes;no;cleverwordplay")
      (msg24 "Are you adverse to black and white?;yes;no;blackwhite")
      (msg25 "Do you love Paul Newman? Do you want to?;yes;no;paulnewmanfan")
      (msg26 "Do you want to watch something great, or legendary?;legendary;great;greatorlegendary")
      (msg27 "Gritty or pretty?;pretty;gritty;grittyorpretty")
      (msg28 "Slow-placed quirky romantic indie?;yes;no;romantic")
      (msg29 "Do you like your humor to be more or less lewd?;more;less;lewd")
      (msg30 "Do you hunger for adventure?;yes;no;adventure")
      (msg31 "Were you a fan of Firefly?;yes;no;firefly")
      (msg32 "Do you like main roles to be played by kids?;yes;no;kidsroles")
      (msg33 "Want some thrills with your adventure?;yes;no;thrills")
      (msg34 "Care for some criminal intent?;yes;no;criminal")
      (msg35 "Do you enjoy diatribes entirely unrelated to the plot?;yes;no;diatribes")
      (msg36 "Are you upset by seeing drug use?;yes;no;drugs")
      (msg37 "Do you love hip-hop?;yes;no;hiphop")
      (msg38 "Mob story?;yes;no;mobstory")
      (msg39 "Ready for some romance?;yes;no;romance")
      (msg40 "Hypothetically: would a long brutal rape scene ruin your night?;yes;no;rape")
      (msg41 "Have you seen the original Girl with the Dragon Tattoo?;yes;no;dragontattoo")
      (msg42 "Have you seen The Girl Who Played with Fire?;yes;no;fireplay")
      (msg43 "Do you want to be completely confused?;yes;no;confused")
      (msg44 "Are subtitles going to be a problem?;yes;no;subtitles2")
      (msg45 "Keep it mellow?;yes;no;mellow")
      (msg46 "Tom Cruise or Matt Damon?;Tom;Matt;tomormatt")
)

; ################# PYTANIA #################

(defrule init
      (initial-fact)
      =>
      (assert (start))
)
(defrule start
      ?i1<-(msg0 ?x)
      ?i2<-(start)
      =>
      (send-to-java ?x)
      (retract ?i1)
      (retract ?i2)
)
(defrule start2
      ?i1<-(start2)
      ?i2<-(msg1 ?x)
      =>
      (send-to-java ?x)
      (retract ?i1)
      (retract ?i2)
)

; ##### odnoga action yes #####

(defrule terminator
      (action yes) ;
      ?i1<-(msg2 ?x) ; aktualny msg
      =>
      (send-to-java ?x)
      (retract ?i1)
)
(defrule war
      (terminator no)
      ?i1<-(msg4 ?x)
      =>
      (send-to-java ?x)
      (retract ?i1)
)
(defrule horses
	(war no)
    ?i1<-(msg5 ?x)
	=>
	(send-to-java ?x)
    (retract ?i1)
)
(defrule oldschool
	(horses yes)
    ?i1<-(msg6 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule serious
	(horses no)
    ?i1<-(msg7 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule future
	(serious yes)
    ?i1<-(msg8 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga documentary yes #####

(defrule documentary
      (action no) 
      ?i1<-(msg3 ?x) 
      =>
      (send-to-java ?x)
      (retract ?i1)
)
(defrule snowboard
	(documentary yes)
    ?i1<-(msg9 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule facemelted
	(snowboard no)
    ?i1<-(msg10 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule streets
	(facemelted no)
    ?i1<-(msg11 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule painorpaint
	(streets yes)
    ?i1<-(msg12 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule religion
	(streets no)
    ?i1<-(msg13 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule woodyallenfan
	(religion no)
    ?i1<-(msg14 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule subtitles
	(woodyallenfan no)
    ?i1<-(msg15 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga monsters yes #####

(defrule monsters
	(documentary no)
    ?i1<-(msg16 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule chainsaw
	(monsters yes)
    ?i1<-(msg17 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule classichorror
	(chainsaw no)
    ?i1<-(msg18 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule asylums
	(classichorror no)
    ?i1<-(msg19 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga laughmood yes #####

(defrule laughmood
	(monsters no)
    ?i1<-(msg20 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule drama
	(laughmood yes)
    ?i1<-(msg21 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule singing
	(drama no)
    ?i1<-(msg22 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule cleverwordplay
	(singing no)
    ?i1<-(msg23 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule blackwhite
	(drama yes)
    ?i1<-(msg24 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule paulnewmanfan
	(blackwhite yes)
    ?i1<-(msg25 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule greatorlegendary
	(paulnewmanfan yes)
    ?i1<-(msg26 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule grittyorpretty
	(paulnewmanfan no)
    ?i1<-(msg27 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule romantic
	(grittyorpretty pretty)
    ?i1<-(msg28 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule lewd
	(blackwhite no)
    ?i1<-(msg29 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga adventure yes #####

(defrule adventure
	(laughmood no)
    ?i1<-(msg30 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule firefly
	(adventure yes)
    ?i1<-(msg31 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule kidsroles
	(firefly no)
    ?i1<-(msg32 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule thrills
	(kidsroles yes)
    ?i1<-(msg33 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga criminal yes #####

(defrule criminal
	(adventure no)
    ?i1<-(msg34 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule diatribes
	(criminal yes)
    ?i1<-(msg35 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule drugs
	(diatribes no)
    ?i1<-(msg36 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule hiphop
	(drugs no)
    ?i1<-(msg37 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule mobstory
	(drugs yes)
    ?i1<-(msg38 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga romance no #####

(defrule romance
	(criminal no)
    ?i1<-(msg39 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule rape
	(romance no)
    ?i1<-(msg40 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule dragontattoo
	(rape no)
    ?i1<-(msg41 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule fireplay
	(dragontattoo yes)
    ?i1<-(msg42 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule confused
	(rape yes)
    ?i1<-(msg43 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule subtitles2
	(confused no)
    ?i1<-(msg44 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)
(defrule mellow
	(subtitles2 yes)
    ?i1<-(msg45 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ##### odnoga romance yes #####

(defrule tomormatt
	(romance yes)
    ?i1<-(msg46 ?x)
    =>
    (send-to-java ?x)
    (retract ?i1)
)

; ################# ODPOWIEDZI #################

(defrule sendanswer
      (answer ?x)
      =>
      (send-to-java ?x)
)

; ##### odnoga dla action yes #####

(defrule terminator_yes
      (terminator yes)
      =>
      (assert (answer "Terminator 2: Judgement day;Exit;_answer"))
)
(defrule war_yes
      (war yes)
      =>
      (assert (answer "Black Hawk Down;Exit;_answer"))
)
(defrule oldschool_old
      (oldschool old)
      =>
      (assert (answer "One Upon a Time in the west;Exit;_answer"))
)
(defrule oldschool_fresh
      (oldschool fresh)
      =>
      (assert (answer "True Grit;Exit;_answer"))
)
(defrule serious_no
      (serious no)
      =>
      (assert (answer "Top gun;Exit;_answer"))
)
(defrule future_now
      (future now)
      =>
      (assert (answer "Shooter;Exit;_answer"))
)
(defrule future_future
      (future future)
      =>
      (assert (answer "Aeon Flux;Exit;_answer"))
)

; ##### odnoga dla documentary yes #####

(defrule snowboard_yes
      (snowboard yes)
      =>
      (assert (answer "Art of flight;Exit;_answer"))
)
(defrule facemelted_yes
      (facemelted yes)
      =>
      (assert (answer "Year of a Horse;Exit;_answer"))
)
(defrule painorpaint_pain
      (painorpaint pain)
      =>
      (assert (answer "Bones Brigade: An Autobiography;Exit;_answer"))
)
(defrule painorpaint_paint
      (painorpaint paint)
      =>
      (assert (answer "Exit Through the Gift Shop;Exit;_answer"))
)
(defrule religion_yes
      (religion yes)
      =>
      (assert (answer "Religulous;Exit;_answer"))
)
(defrule woodyallenfan_yes
      (woodyallenfan yes)
      =>
      (assert (answer "Woody Allen: A Documentary;Exit;_answer"))
)
(defrule subtitles_yes
      (subtitles yes)
      =>
      (assert (answer "Grizzly Man;Exit;_answer"))
)
(defrule subtitles_no
      (subtitles no)
      =>
      (assert (answer "Man on Wire;Exit;_answer"))
)

; ##### odnoga dla documentary yes #####

(defrule chainsaw_yes
      (chainsaw yes)
      =>
      (assert (answer "The Evil Dead;Exit;_answer"))
)
(defrule classichorror_yes
      (classichorror yes)
      =>
      (assert (answer "Cabin in the Woods;Exit;_answer"))
)
(defrule asylums_yes
      (asylums yes)
      =>
      (assert (answer "Session 9;Exit;_answer"))
)
(defrule asylums_no
      (asylums no)
      =>
      (assert (answer "Insidious;Exit;_answer"))
)

; ##### odnoga laughmood yes #####

(defrule singing_yes
      (singing yes)
      =>
      (assert (answer "Happy Gilmore;Exit;_answer"))
)
(defrule cleverwordplay_yes
      (cleverwordplay yes)
      =>
      (assert (answer "Duck Soup;Exit;_answer"))
)
(defrule cleverwordplay_no
      (cleverwordplay no)
      =>
      (assert (answer "Ferris Bueller's Day Off;Exit;_answer"))
)
(defrule greatorlegendary_legendary
      (greatorlegendary legendary)
      =>
      (assert (answer "Butch Cassidy and the Sundance Kid;Exit;_answer"))
)
(defrule greatorlegendary_great
      (greatorlegendary great)
      =>
      (assert (answer "Slap Shot;Exit;_answer"))
)
(defrule grittyorpretty_gritty
      (grittyorpretty gritty)
      =>
      (assert (answer "Trainspotting;Exit;_answer"))
)
(defrule romantic_yes
      (romantic yes)
      =>
      (assert (answer "Lost in Translation;Exit;_answer"))
)
(defrule romantic_no
      (romantic no)
      =>
      (assert (answer "Big Fish;Exit;_answer"))
)
(defrule lewd_more
      (lewd more)
      =>
      (assert (answer "Clerks;Exit;_answer"))
)
(defrule lewd_less
      (lewd less)
      =>
      (assert (answer "ManHattan;Exit;_answer"))
)

; ##### odnoga adventure yes #####

(defrule firefly_yes
      (firefly yes)
      =>
      (assert (answer "Serenity;Exit;_answer"))
)
(defrule kidsroles_no
      (kidsroles no)
      =>
      (assert (answer "Star Trek II: The Wrath of Khan;Exit;_answer"))
)
(defrule thrills_yes
      (thrills yes)
      =>
      (assert (answer "Super 8;Exit;_answer"))
)
(defrule thrills_no
      (thrills no)
      =>
      (assert (answer "The Hunger Games;Exit;_answer"))
)

; ##### odnoga criminal yes #####

(defrule diatribes_yes
      (diatribes yes)
      =>
      (assert (answer "Reservoir Dogs;Exit;_answer"))
)
(defrule hiphop_yes
      (hiphop yes)
      =>
      (assert (answer "Hustle & Flow;Exit;_answer"))
)
(defrule hiphop_no
      (hiphop no)
      =>
      (assert (answer "Traffic;Exit;_answer"))
)
(defrule mobstory_yes
      (mobstory yes)
      =>
      (assert (answer "Miller's Crossing;Exit;_answer"))
)
(defrule mobstory_no
      (mobstory no)
      =>
      (assert (answer "Clay Pigeons;Exit;_answer"))
)

; ##### odnoga romance no #####

(defrule dragontattoo_no
      (dragontattoo no)
      =>
      (assert (answer "The Girl with the Dragon Tattoo;Exit;_answer"))
)
(defrule fireplay_no
      (fireplay no)
      =>
      (assert (answer "The Girl who Played with Fire;Exit;_answer"))
)
(defrule fireplay_yes
      (fireplay yes)
      =>
      (assert (answer "The Girl who Kicked the Hornets' Nest;Exit;_answer"))
)
(defrule confused_yes
      (confused yes)
      =>
      (assert (answer "Pi;Exit;_answer"))
)
(defrule subtitles2_no
      (subtitles2 no)
      =>
      (assert (answer "Tomboy;Exit;_answer"))
)
(defrule mellow_yes
      (mellow yes)
      =>
      (assert (answer "Midnight Cowboy;Exit;_answer"))
)
(defrule mellow_no
      (mellow no)
      =>
      (assert (answer "The Machinist;Exit;_answer"))
)
(defrule tomormatt_tom
      (tomormatt Tom)
      =>
      (assert (answer "Vanilla Sky;Exit;_answer"))
)
(defrule tomormatt_matt
      (tomormatt Matt)
      =>
      (assert (answer "Good Will Hunting;Exit;_answer"))
)