function p = pTypeGivenHistory(type, history, priorPTypes)

numTypes = numel(priorPTypes);
pType = priorPTypes(type);

pHistoryGivenTypes = zeros(1, numTypes);
for i = 1:numTypes
    pHistoryGivenTypes(i) = pHistoryGivenType(history, i);
end
pHistory = sum(pHistoryGivenTypes .* priorPTypes);

p = pHistoryGivenTypes(type) * pType / pHistory;

end

