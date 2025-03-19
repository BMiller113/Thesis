function [normalizedFeatures, meanValues, stdValues] = normalizeFeatures(features)
    % Convert the cell array to a matrix
    featureMatrix = cell2mat(cellfun(@(x) x(:), features, 'UniformOutput', false));

    % Mean/Standard Dev
    meanValues = mean(featureMatrix, 2);
    stdValues = std(featureMatrix, 0, 2);

    % Normalize features
    normalizedFeatures = cell(size(features));
    for i = 1:length(features)
        normalizedFeatures{i} = (features{i} - meanValues) ./ stdValues;
    end
end