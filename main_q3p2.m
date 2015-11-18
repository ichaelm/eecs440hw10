nTrials = 100;
sampleSize = 10;

resolution = 11;

evaluation_xs = linspace(-1, 1, resolution);
evaluation_ys = linspace(-1, 1, resolution);

evaluation = zeros(nTrials, resolution, resolution);

for iTrial = 1:nTrials
    xs = (rand(sampleSize, 1) - 0.5) * 2;
    ys = (rand(sampleSize, 1) - 0.5) * 2;
    fs = f(xs, ys);
    
    model = fitlm([xs, ys], fs);
    
    %h00 = predict(model, [-1,-1]);
    %h11 = predict(model, [1,1]);
    %expected_h = (h00 + h11) / 2;
    
    for x_index = 1:resolution
        for y_index = 1:resolution
            evaluation(iTrial, x_index, y_index) = predict(model, [evaluation_xs(x_index), evaluation_ys(y_index)]);
        end
    end
end

actual = zeros(resolution, resolution);
for x_index = 1:resolution
    for y_index = 1:resolution
        actual(x_index, y_index) = f(evaluation_xs(x_index), evaluation_ys(y_index));
    end
end

biases = zeros(resolution, resolution);
for x_index = 1:resolution
    for y_index = 1:resolution
        sum = 0;
        for iTrial = 1:nTrials
            sum = sum + evaluation(iTrial, x_index, y_index);
        end
        sum = sum - (nTrials * actual(x_index, y_index));
        biases(x_index, y_index) = sum / nTrials;
    end
end

expectations = zeros(resolution, resolution);
for x_index = 1:resolution
    for y_index = 1:resolution
        sum = 0;
        for iTrial = 1:nTrials
            sum = sum + evaluation(iTrial, x_index, y_index);
        end
        expectations(x_index, y_index) = sum / nTrials;
    end
end

variances = zeros(resolution, resolution);
for x_index = 1:resolution
    for y_index = 1:resolution
        sum = 0;
        for iTrial = 1:nTrials
            sum = sum + (evaluation(iTrial, x_index, y_index) - expectations(x_index, y_index))^2;
        end
        variances(x_index, y_index) = sum / nTrials;
    end
end

imagesc(biases);
title('Bias[h(x,y)]')
xlabel('x');
ylabel('y');
colorbar;
figure();
imagesc(variances);
title('Variance[h(x,y)]')
xlabel('x');
ylabel('y');
colorbar;

