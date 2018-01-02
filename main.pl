%% Simple Prolog cde to assess project membership uniqueness among students

% Start by loading the existing projects

:- multifile(is_part_of/3),
%   consult('data/pokerhand.pl'),
   consult('data/takenoko.pl'),
   consult('data/hashcode.pl').

violate_rule(Member) :-
    identify_violation(Member,_,_,_).

identify_violation(Member, AnotherMember, AnotherTeam, AnotherProject) :-
    is_part_of(Member, TheTeam, TheProject),
    is_part_of(AnotherMember, TheTeam, TheProject),
    AnotherMember \= Member,
    is_part_of(AnotherMember, AnotherTeam, AnotherProject),
    AnotherProject \= TheProject,
    is_part_of(Member, AnotherTeam, AnotherProject).

