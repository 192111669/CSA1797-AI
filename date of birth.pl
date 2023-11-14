dob(viany, '1990-05-15').
dob(srivas, '1985-11-20').
dob(anil, '1992-03-10').
dob(virat, '1978-09-25').
dob(rehman, '1980-07-30').

get_dob(Name, DateOfBirth) :-
    dob(Name, DateOfBirth).

born_after(Year, Name) :-
    dob(Name, DateOfBirth),
    sub_string(DateOfBirth, 0, 4, _, YearOfBirth),
    atom_number(YearOfBirth, YearBorn),
    YearBorn > Year.
