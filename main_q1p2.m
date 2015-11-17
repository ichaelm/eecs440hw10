pYummyGivenType = [.75 .5 .25];
priorPTypes = [1/3, 1/3, 1/3];

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

allPCrummyGiven1 = sum([allP1Given1; allP2Given1; allP3Given1] .* repmat((1 - pYummyGivenType)', 1, 100), 1);
allPCrummyGiven2 = sum([allP1Given2; allP2Given2; allP3Given2] .* repmat((1 - pYummyGivenType)', 1, 100), 1);
allPCrummyGiven3 = sum([allP1Given3; allP2Given3; allP3Given3] .* repmat((1 - pYummyGivenType)', 1, 100), 1);

x = 1:99;
plot(x, allPCrummyGiven1(1:99));
title('Probability the next candy is crummy after each candy (actually box 1)')
ylim([0, 1])
figure()
plot(x, allPCrummyGiven2(1:99));
title('Probability the next candy is crummy after each candy (actually box 2)')
ylim([0, 1])
figure()
plot(x, allPCrummyGiven3(1:99));
title('Probability the next candy is crummy after each candy (actually box 3)')
ylim([0, 1])