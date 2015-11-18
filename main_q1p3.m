pYummyGivenType = [.75 .5 .25];
priorPTypes = [0.8, 0.1, 0.1];

box1 = rand(1, 100) < pYummyGivenType(1);
box2 = rand(1, 100) < pYummyGivenType(2);
box3 = rand(1, 100) < pYummyGivenType(3);

allP1Given1 = allPTypeGivenHistory(1, box1, priorPTypes);
allP2Given1 = allPTypeGivenHistory(2, box1, priorPTypes);
allP3Given1 = allPTypeGivenHistory(3, box1, priorPTypes);
allP1Given2 = allPTypeGivenHistory(1, box2, priorPTypes);
allP2Given2 = allPTypeGivenHistory(2, box2, priorPTypes);
allP3Given2 = allPTypeGivenHistory(3, box2, priorPTypes);
allP1Given3 = allPTypeGivenHistory(1, box3, priorPTypes);
allP2Given3 = allPTypeGivenHistory(2, box3, priorPTypes);
allP3Given3 = allPTypeGivenHistory(3, box3, priorPTypes);

x = 1:100;
plot(x, allP1Given1, x, allP2Given1, x, allP3Given1);
title('Probability the box is of each type after each candy (actually box 1)')
legend('p(T=1)', 'p(T=2)', 'p(T=3)')
figure()
plot(x, allP1Given2, x, allP2Given2, x, allP3Given2);
title('Probability the box is of each type after each candy (actually box 2)')
legend('p(T=1)', 'p(T=2)', 'p(T=3)')
figure()
plot(x, allP1Given3, x, allP2Given3, x, allP3Given3);
title('Probability the box is of each type after each candy (actually box 3)')
legend('p(T=1)', 'p(T=2)', 'p(T=3)')