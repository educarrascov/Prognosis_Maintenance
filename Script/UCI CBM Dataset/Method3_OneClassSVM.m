%% Examples of Data Analytics for Predictive Maintenance (3)
% Copyright 2018 The MathWorks, Inc.

%% Method3: One-Class SVM
% The previous methods, Hotelling�fs T-square method and Gaussian mixture 
% model, use Gaussian distribution-based parametric model.  However, in 
% practical situation, sometimes data distribution does not have explicit 
% clusters or, in more severe case, cannot be grasped for many reasons, such 
% as large number of dimensions.  In such a case, non-parametric model can 
% be applicable.  In this demo, I would like to show how one class SVM, one 
% of typical non-parametric classification method, can detect an x percent 
% outliers from a given data set.

%% Load the Pre-processed Data
% This data is generated by running <./Demo0_PreProcessing.html
% Demo0_PreProcessing.m>.
load('Preprocessed_FD001.mat');

%% Outlier Detection using One-Class SVM
% To visualize results, I would like to apply One-Class SVM to
% the first two PCA components.
%
% First, the group of data points labeled 'long' is assumed as a normal
% condition.
%
% Next, the thresholds to detect 5%, 1% and 0.1% outliers are calculated
% by using One-Class SVM method.
%
% Finally, I would like to create a plot of the first two components with
% these thresholds.

% Calculate the thresholds to detect 5%, 1% and 0.1% outliers
idx = (dataTrainZ.Label == 'long');
th = [0.001, 0.01, 0.05];
mdlSVM = cell(3,1);
C = cell(3,1);

d = 0.1;
[x1Grid, x2Grid] = meshgrid(-8:d:8, -8:d:8);
for kk = 1:3
    mdlSVM{kk} = fitcsvm(score(idx,1:2), ones(nnz(idx),1),...
        'KernelFunction',   'rbf',...
        'OutlierFraction',  th(kk));
    [~, aGrid] = predict(mdlSVM{kk}, [x1Grid(:) x2Grid(:)]);
    aGrid = reshape(aGrid, size(x1Grid,1), size(x2Grid,2));
    
    % Generated thresholds based on One-Class SVM
    C{kk} = contourc((-8:d:8), (-8:d:8), aGrid, [0 0]);
end

% Set the color for 5%, 1% and 0.1% outlier regions
col5per = [0.75 0.95 1];
col1per = [0.75 1 0.75];
col01per = [1 1 0.75];
colAnomaly = [1 0.85 0.85];

% Plot the result
figure
plotContourmatrix(C{1}, col01per);
plotContourmatrix(C{2}, col1per);
plotContourmatrix(C{3}, col5per);
hold on;
s1 = gscatter(score(:,1),...
    score(:,2),...
    dataTrainZ.Label);
idx = dataTrainZ.Time == 0;
s2 = plot(score(idx,1),...
    score(idx,2),'rp','MarkerSize',10,'MarkerFaceColor','w');
legend([s1; s2],{'urgent','short','medium','long','failure occurrence'},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
ax = gca;
ax.Color = colAnomaly;
ax.Box = 'on';
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);
title({'Training Data and Calculated Outlier Detection Threshold';...
    'Blue: Normal, Green: 5% outlier, Yellow: 1% outlier, Red: 0.1% outlier'},'FontSize',12)

%% Applying to the Test Set
% In this process, these thresholds (which can detect 5%, 1% and 0.1% 
% outliers) are applied to the test data set.  The result is shown by
% creating a plot of the first two components with test set and these
% thresholds.  In this plot, conditions of each engine are shown by
% changing colors for each data point.  In real situaiton, only the
% positions of each data point and the thresholds for outlier detection
% are available.
%
% As shown in this plot, the thresholds for outlier detectio calcuated by
% the One-Class SVM is also quite helpful to detect anomalies and
% foresee machine failure during normal operation.  In this example, all
% the 'urgent' condition in the test set can be detected by using the 
% threshold for 1% outlier detection.

% Standardize the test set
dataTestZ = dataTest;
dataTestZ{:,3:end-1} = (dataTest{:,3:end-1} - mu)./sigma;

score = dataTestZ{:,3:end-1}*wcoeff;

% Plot the result
figure
plotContourmatrix(C{1}, col01per);
plotContourmatrix(C{2}, col1per);
plotContourmatrix(C{3}, col5per);
hold on;
s1 = gscatter(score(:,1),...
    score(:,2),...
    dataTestZ.Label);
legend(s1,{s1.DisplayName},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
ax = gca;
ax.Color = colAnomaly;
ax.Box = 'on';
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);
title({'Applying Outlier Detection Threshold for the Test Data';...
    'Blue: Normal, Green: 5% outlier, Yellow: 1% outlier, Red: 0.1% outlier'},'FontSize',12)
