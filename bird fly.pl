bird(canary).
bird(penguin).
bird(sparrow).
bird(ostrich).

can_fly(X) :- bird(X), \+flightless(X).

flightless(penguin).
flightless(ostrich).
