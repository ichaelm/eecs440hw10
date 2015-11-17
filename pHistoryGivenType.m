function p = pHistoryGivenType(history, type)

historyLength = numel(history);
p = 1;
for i = 1:historyLength
    candy = history(i);
    p = p * pCandyGivenType(candy, type);
end

end

