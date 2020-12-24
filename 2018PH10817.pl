male(kuru).
male(parashara).
male(shantanu).
male(vyasa).
male(vidura).
male(dhritrashtra).
male(bheesma).
male(vichitravirya).
male(pandu).
male(vasudeva).
male(duryodhana).
male(nakula).
male(sahadeva).
male(arjuna).
male(bhima).
male(yudhisthira).
male(karna).
male(satanika).
male(srutasena).
male(srutakarman).
male(abhimanyu).
male(iravan).
male(babruvahana).
male(sutasoma).
male(ghatotchkacha).
male(prativindhya).
male(parikshit).
male(janamejaya).
male(krishna).
male(balaram).
female(ganga).
female(satyavati).
female(ambika).
female(amba).
female(ambalika).
female(poorna).
female(madri).
female(gandhari).
female(kunti).
female(devaki).
female(rohini).
female(dussala).
female(rukmini).
female(draupadi).
female(subhadra).
female(ulupi).
female(chitrangda).
female(vrishali).
female(hidimba).
female(uttara).
female(madravti).
female(vapushtama).
married(dhritrashtra,gandhari).
married(pandu,kunti).
married(pandu,madri).
married(vasudeva,devaki).
married(vasudeva,rohini).
married(nakula,draupadi).
married(sahadeva,draupadi).
married(arjuna,draupadi).
married(arjuna,subhadra).
married(arjuna,ulupi).
married(arjuna,chitrangda).
married(bhima,draupadi).
married(bhima,hidimba).
married(yudhisthira,draupadi).
married(abhimanyu,uttara).
married(parikshit,madravti).
married(janamejaya,vapushtama).
married(shantanu,ganga).
married(vyasa,poorna).
married(parashara,satyavati).
married(karna,vrishali).
married(kunti,pandu).
married(gandhari,dhritrashtra).
married(madri,pandu).
married(devaki,vasudeva).
married(rohini,vasudeva).
married(draupadi,nakula).
married(draupadi,sahadeva).
married(draupadi,arjuna).
married(subhadra,arjuna).
married(ulupi,arjuna).
married(chitrangda,arjuna).
married(draupadi,bhima).
married(hidimba,bhima).
married(draupadi,yudhisthira).
married(uttara,abhimanyu).
married(madravti,parikshit).
married(vapushtama,janamejaya).
married(ganga,shantanu).
married(poorna,vyasa).
married(satyavati,parashara).
married(vrishali,karna).
married(satyavati,shantanu).
married(shantanu,satyavati).
child(vyasa,parashara).
child(vyasa,satyavati).
child(bheesma,shantanu).
child(vichitravirya,shantanu).
child(bheesma,ganga).
child(vichitravirya,satyavati).
child(vidura,poorna).
child(vidura,vyasa).
child(pandu,ambalika).
child(dhritrashtra,ambika).
child(duryodhana,dhritrashtra).
child(duryodhana,gandhari).
child(nakula,madri).
child(sahadeva,madri).
child(nakula,pandu).
child(sahadeva,pandu).
child(arjuna,kunti).
child(bhima,kunti).
child(yudhisthira,kunti).
child(arjuna,pandu).
child(bhima,pandu).
child(yudhisthira,pandu).
child(krishna,vasudeva).
child(krishna,devaki).
child(subhadra,vasudeva).
child(balaram,vasudeva).
child(subhadra,rohini).
child(balaram,rohini).
child(abhimanyu,arjuna).
child(abhimanyu,subhadra).
child(ghatotchkacha,bhima).
child(ghatotchkacha,hidimba).
child(prativindhya,yudhisthira).
child(prativindhya,draupadi).
child(sutasoma,bhima).
child(sutasoma,draupadi).
child(srutakarman,arjuna).
child(srutakarman,draupadi).
child(srutasena,nakula).
child(srutasena,draupadi).
child(satanika,sahadeva).
child(satanika,draupadi).
child(iravan,arjuna).
child(babruvahana,chitrangda).
child(iravan,ulupi).
child(babruvahana,arjuna).
child(parikshit,uttara).
child(parikshit,abhimanyu).
child(janamejaya,parikshit).
child(janamejaya,madravti).
child(karna,kunti).
parent(X,Y) :- child(Y,X).
father(X,Y) :- male(X),child(Y,X).
mother2(X,Y) :- female(X),child(Y,X).
mother1(X,Y) :- female(X),father(F,Y),husband(F,X).
mother(X,Y) :- setof(T,mother1(X,Y),List), member(T,List).
son(X,Y) :- male(X), child(X,Y).
daughter(X,Y) :- female(X), child(X,Y).
husband(X,Y) :- male(X), married(X,Y).
wife(X,Y) :- husband(Y,X).
spouse(X,Y) :- (husband(X,Y);wife(X,Y)).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandfather(X,Y) :- male(X),grandparent(X,Y).
grandmother(X,Y) :- female(X),grandparent(X,Y).
grandchild(X,Y) :- grandparent(Y,X).
grandson(X,Y) :- male(X), grandchild(X,Y).
granddaughter(X,Y) :- female(X), grandchild(X,Y).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z),ancestor(Z,Y).
descendent(X,Y) :- ancestor(Y,X).
sibling2(X,Y) :- parent(Z,X),parent(Z,Y), X\=Y.
sibling(X,Y) :- setof(T,sibling2(X,Y),List),member(T,List).
sibling1(X,Y) :- father(F,X), father(F,Y), mother(M,X), mother(M,Y), X \= Y.
sister(X,Y) :- female(X), sibling1(X,Y).
brother(X,Y) :- male(X), sibling1(X,Y).
parentinlaw(X,Y) :- parent(X,Z), married(Z,Y).
motherinlaw(X,Y) :- female(X), parentinlaw(X,Y).
fatherinlaw(X,Y) :- male(X), parentinlaw(X,Y).
brotherinlaw(X,Y) :- male(X), married(Z,Y), sibling(X,Z).
sisterinlaw(X,Y) :- female(X), married(Z,X), sibling(X,Z).
soninlaw(X,Y) :- male(X), married(X,Z), parent(Y,Z).
daughterinlaw(X,Y) :- female(X), married(X,Z), parent(Y,Z).
greatgrandparent(X,Y) :- parent(X,Z), grandparent(Z,Y).
greatgrandmother(X,Y) :- female(X), greatgrandparent(X,Y).
greatgrandfather(X,Y) :- male(X), greatgrandparent(X,Y).
greatgrandson(X,Y) :- male(X), greatgrandparent(Y,X).
greatgranddaughter(X,Y) :- female(X), greatgrandparent(Y,X).
uncle(X,Y) :- male(X), sibling(X,Z), parent(Z,Y).
uncle(X,Y) :- male(X), married(X,Z),sibling(Z,W), parent(W,Y).
aunt1(X,Y) :- female(X), sibling(X,Z), parent(Z,Y).
aunt1(X,Y) :- female(X), married(X,Z), sibling(Z,W), parent(W,Y),mother(M,Y), M\=X.
aunt(X,Y) :- setof(T,aunt1(X,Y),List),member(T,List).
cousin1(X,Y) :- parent(Z,X), sibling(Z,W), parent(W,Y).
cousin(X,Y) :- setof(T,cousin1(X,Y),List),member(T,List).
nephew(X,Y) :- male(X), parent(Z,X), sibling(Z,Y).
niece(X,Y) :- female(X), parent(Z,X), sibling(Z,Y).