function layers = defineCNNArchitecture()
    layers = [
        imageInputLayer([32 40 1]) % Input layer (32 frames x 40 filterbanks)
        
        convolution2dLayer([20 9], 54, 'Stride', [1 1], 'Padding', 'same')
        reluLayer() 
        maxPooling2dLayer([1 3], 'Stride', [1 3])
        
        convolution2dLayer([6 4], 54, 'Stride', [1 1], 'Padding', 'same')
        reluLayer()
        
        fullyConnectedLayer(128)
        reluLayer()
        
        fullyConnectedLayer(14) % Output layer (14 keywords)
        softmaxLayer()
        classificationLayer()];
end