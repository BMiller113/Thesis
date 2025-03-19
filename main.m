% Using Kaggle_GoogleSpeechCommandsV2


% Load the dataset
[audioFiles, labels, testingFiles, validationFiles] = loadAudioData();

% Extract features for training, testing, and validation sets
trainingFeatures = extractFeatures(audioFiles);
testingFeatures = extractFeatures(testingFiles);
validationFeatures = extractFeatures(validationFiles);

% Train
layers = defineCNNArchitecture();
net = trainCNN(trainingFeatures, labels, layers);

% Evaluate model
accuracy = evaluateModel(net, testingFeatures, labels);
disp(['Test Accuracy: ', num2str(accuracy)]);