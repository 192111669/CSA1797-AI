% Facts representing symptoms and diseases
symptom(john, fever).
symptom(john, cough).
symptom(jane, headache).
symptom(jane, nausea).

% Rules defining relationships between symptoms and diseases
has_disease(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, cough).

has_disease(Patient, migraine) :-
    symptom(Patient, headache),
    \+ symptom(Patient, fever),
    \+ symptom(Patient, cough).

has_disease(Patient, stomach_flu) :-
    symptom(Patient, nausea),
    symptom(Patient, fever),
    \+ symptom(Patient, headache).

% Rule for diagnosing a patient
diagnose(Patient, Disease) :-
    has_disease(Patient, Disease),
    format('Patient ~w has been diagnosed with ~w.~n', [Patient, Disease]).

diagnose(Patient, 'No specific disease found') :-
    \+ has_disease(Patient, _),
    format('No specific disease found for patient ~w.~n', [Patient]).
