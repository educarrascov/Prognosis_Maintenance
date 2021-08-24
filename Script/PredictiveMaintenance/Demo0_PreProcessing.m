%% Examples of Data Analytics for Predictive Maintenance
% Copyright 2018 The MathWorks, Inc.

%% Summary
% Rare events prediction in complex technical systems has been very
% interesting and critical issue for many industrial and commercial fields
% due to huge increase of sensors and rapid growth of Internet of Things (IoT).
% To detect anomalies and foresee machine failure during normal operation, 
% various types of Predictive Maintenance (PdM) techniques have been
% studied, as shown in the following table.
%
% <<summary.png>>
%
% Among these techniques, unsupervised anomaly detection methods for
% multi-dimensional dataset would be of more interest in many practical
% cases.  So, in this demo, I have selected following three typical methods.
%
% # Htelling's T-square method (<./Method1_HotellingsT2.html Demo>)
% # Gaussian mixture model (<./Method2_GaussianMixture.html Demo>)
% # One-class SVM (<./Method3_OneClassSVM.html Demo>)
%
% To emulate a realistic situation, in this demo, I will use the dataset 
% provided by C-MAPSST (Commercial Modular Aero-Propulsion SystemSimulation) 
% [1, 2].  This dataset includes various sensor data from aircraft engines
% throughout their usage cycle.  The data is divided into traininng and
% test set.  The training set has trajectories that ends at the cycle in
% which the failure occurs for each engine.  The test set also has
% trajectories but ends at the cycle prior to the failure.  The number of
% additional cycles till failure occurs for each engine in the test set is 
% given by a separate file. Details of the data set used in this example is
% as follows:
%
% Data Set: FD001
%
% * Train trjectories: 100
% * Test trajectories: 100
% * Conditions: ONE (Sea Level)
% * Fault Modes: ONE (HPC Degradation)
%
% [1] A. Saxena, K. Goebel, D. Simon and N. Eklund, "Damage Propagation
% Modeling for Aircraft Engine Run-to-Failure Simulation," International Conference on Prognostics and Health Management, (2008).
%
% [2] <https://ti.arc.nasa.gov/tech/dash/groups/pcoe/prognostic-data-repository/#turbofan Turbofan Engine Degradation Simulation Data Set>

%% Load the Dataset
% Load the training and test set of FD001.

dataTrain = importFDdata('train_FD001.txt');
dataTest = importFDdata('test_FD001.txt');
RULTest = csvread('RUL_FD001.txt');

%% Data Preprocessing (Training set)
% As a data preprocessing, the following process is applied to the training data:
%
% * Setting the valiable names
% * Extracting effective sensors
% * Labeling the condition into 4 categories based on the remaining cycles till failure occurs 
%
% The relationship between each category and remaining cycles is as follws: 
%
% # 0~50 cycles   : urgent
% # 51~125 cycles : short
% # 126~200 cycles: medium
% # 201~          : long
dataTrain = dataCleaning(dataTrain);

%% Data Preprocessing (Test set)

% Apply the same preprocessing to the test set
dataTest = dataCleaning(dataTest);

% Extract the last record of sensors for each engine
dataTest = dataTest(dataTest.Time == 0, 1:end-1);
dataTest.Time = -RULTest;

% Labeling the condition
catname = {'urgent','short','medium','long'};
dataTest.Label = discretize(-dataTest.Time, [0 51 126 201 inf],'categorical',catname);

%% Visualize The Data

% Visualize the training data (each color represents long/medium/short/urgent) 
figure('Position',[50 500 900 420])
for kk = 1:14
    subplot(3,5,kk);
    gscatter(dataTrain.Time, dataTrain{:,2+kk}, dataTrain.Label);
    title(dataTrain.Properties.VariableNames{2+kk})
    legend('off');
end

%% Standardize Sensor Data
dataTrainZ = dataTrain;
[dataTrainZ{:,3:end-1}, mu, sigma] = zscore(dataTrainZ{:,3:end-1});

%% Dimensionality Reduction using PCA
% Applying PCA (Principal Component Analysis) to the standardized training set.
% In this process, you can see the only the first two (instead of the total 14)
% components explain 79% of the total variance.
%
% In addition, by creating a plot of the first two components, you can
% conrirm that (1) 'long' class data forms three clusters, and (2) value of
% the first component increases as the the number of cycles.

varName = dataTrainZ.Properties.VariableNames(3:end-1);
[wcoeff,score,latent] = pca(dataTrainZ{:,varName});

% Plot the individual and cumulative variance explained by PCA components
figure
plot([cumsum(latent(1:10))/sum(latent) latent(1:10)/sum(latent)]*100,'o');
xlabel('Number of Principal Components','FontSize', 12);
ylabel('Explained Variance [%]','FontSize', 12);
legend({'Cumulative','Individual'},'FontSize', 12);
title('Individual and Cumulative Variance Explained by PCA','FontSize', 12);

% Creating a plot of the first two components
figure
s1 = gscatter(score(:,1), score(:,2), dataTrainZ.Label);
hold on;
idx = dataTrainZ.Time == 0;
s2 = plot(score(idx,1), score(idx,2),'rp','MarkerSize',10,'MarkerFaceColor','w');
legend([s1; s2],{'urgent','short','medium','long','failure occurrence'},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);

%% Visualize a Trajectory of Unit-1 in 1st and 2nd Principal Components Plane

idxUnit = dataTrain.Unit == 1;
idxFailure = idxUnit & dataTrainZ.Time == 0;

figure
s1 = gscatter(score(idxUnit,1), score(idxUnit,2), dataTrainZ.Label(idxUnit));
hold on;
idx = dataTrainZ.Time == 0;
s2 = plot(score(idxFailure,1), score(idxFailure,2),'rp','MarkerSize',10,'MarkerFaceColor','w');
legend([s1; s2],{'urgent','short','medium','failure occurrence'},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);
ax = gca;
ax.XLim = [-8 12];
ax.YLim = [-5 10];

%% Save the Pre-processed Data
% These data will be used in the following demos:
%
% * <./Method1_HotellingsT2.html Method1_HotellingsT2.m>
% * <./Method2_GaussianMixture.html Method2_GaussianMixture.m>
% * <./Method3_OneClassSVM.html Method3_OneClassSVM.m>

save('Preprocessed_FD001.mat','dataTrainZ','dataTest','score','wcoeff','mu','sigma');
