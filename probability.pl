% Define the probabilities
probability(stiff_neck_given_meningitis, 0.7).
probability(meningitis, 0.00002).
probability(stiff_neck, 0.01).

% Calculate the probability of Meningitis given Stiff neck
probability_meningitis_given_stiff_neck(P) :-
    probability(stiff_neck_given_meningitis, P_stiff_given_meningitis),
    probability(meningitis, P_meningitis),
    probability(stiff_neck, P_stiff_neck),
    P is (P_stiff_given_meningitis * P_meningitis) / P_stiff_neck.

% Query to calculate the probability of Meningitis given Stiff neck
% probability_meningitis_given_stiff_neck(P).