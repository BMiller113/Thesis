function features = extractFeatures(audioFiles)
    % Extract log-mel filterbank features from audio files
    numFiles = length(audioFiles);
    features = cell(numFiles, 1);

    % Define parameters
    frameDuration = 0.025; 
    overlapDuration = 0.01; %ms
    numBands = 40;
    targetFrames = 100;

    for i = 1:numFiles
        [audioIn, fs] = audioread(audioFiles{i});
        audioIn = audioIn / max(abs(audioIn));

        % Compute frame length and overlap in samples
        frameLength = round(frameDuration * fs);
        overlapLength = round(overlapDuration * fs);

        [s, f, t] = spectrogram(audioIn, hamming(frameLength), overlapLength, frameLength, fs);


        spectrogramMagnitude = abs(s);
        melFilterbank = designAuditoryFilterBank(fs, 'NumBands', numBands, 'FFTLength', frameLength);
        melSpectrogram = melFilterbank * spectrogramMagnitude;
        logMelSpectrogram = log10(melSpectrogram + eps);
        [numBands, numFrames] = size(logMelSpectrogram);
        if numFrames < targetFrames
            logMelSpectrogram = [logMelSpectrogram, zeros(numBands, targetFrames - numFrames)]; % Zero paddings
        elseif numFrames > targetFrames
            % Truncate
            logMelSpectrogram = logMelSpectrogram(:, 1:targetFrames);
        end
        features{i} = logMelSpectrogram;
    end
end
