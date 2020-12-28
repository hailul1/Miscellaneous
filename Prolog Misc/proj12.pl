%%%%%%% Car Problem %%%%%%%%%%%
% Fact Base
% speed(vehicle, speed)
%   Average speed of vehicles 
% time(vehicle, time)
%   Amount of time vehicle is driving

speed(ford, 100).
speed(chevy, 105).
speed(dodge, 95).
speed(volvo, 80).

time(ford, 20).
time(chevy, 21).
time(dodge, 24).
time(volvo, 24).

% Relationship between speed, time, and distance

distance(X) :-
    speed(X, Speed), time(X, Time), Y is Speed * Time,
    write('Distance traveled by '),
    write(X),
    write(' '),
    write('was '),
    write(Y).

%%%%%% Ice Cream Problem %%%%%%%
% Fact Base
scoop(chocolate).
scoop(strawberry).
scoop(vanilla).

% Rules
three_scoops :-
    scoop(Top),
    scoop(Middle),
    scoop(Bottom),
    write(Top + Middle + Bottom),
    nl,
    fail.

%%%%%% Monkey Banana Problem %%%%%%%%
perform(grasp, state(middle, middle, onbox, hasnot),
                state(middle, middle, onbox, has)).
perform(climb, state(BP, BP, onfloor, H),
                state(BP, BP, onbox, H)).
perform(pushbox, state(P1, P1, onfloor, H), 
                state(P2, P2, onfloor, H)).
perform(walk, state(P1, BP, onfloor, H),
                state(P2, BP, onfloor, H)).
getfood(state(_, _, _, has)).
getfood(S1) :-
    perform(Act, S1, S2), 
    nl, write('In'), write(S1),
    nl, write('Try'), write(Act),
    nl, write('Now'), write(S2), nl,
    getfood(S2).