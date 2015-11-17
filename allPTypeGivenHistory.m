function ps = allPTypeGivenHistory(type, history, priorPTypes)

historyLength = numel(history);
ps = zeros(1, historyLength);
for i = 1:historyLength
    currentHistory = history(1:i);
    ps(i) = pTypeGivenHistory(type, currentHistory, priorPTypes);
end

end

