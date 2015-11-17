function p = pCandyGivenType(candy, type)

pYummyGivenTypes = [.75 .5 .25];
if (candy > 0.5)
    p = pYummyGivenTypes(type);
else
    p = 1-pYummyGivenTypes(type);
end

end

