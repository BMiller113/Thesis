function accuracy = evaluateModel(net, XTest, YTest)
    % Predict using the trained network
    YPred = classify(net, XTest);
    accuracy = sum(YPred == YTest) / numel(YTest);
end