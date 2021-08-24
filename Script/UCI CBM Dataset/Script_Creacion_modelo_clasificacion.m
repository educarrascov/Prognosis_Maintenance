clear all
clc
%Esto permite la creación de los vectores de cada variable respecto a un
%archivo creado en excel%
%la ventaja es que se puede editar el archivo en excel y luego modificarlo
%desde aquí%
DataSet=readtable('DataSet.xlsx','ReadVariableNames',true);

%e pueden realizar algunos gráficos como los siguientes%
%todas las variables en función de la velocidad%
figure
for ii=1:15
    subplot(4,4,ii)
    plot(DataSet.Speed,DataSet{:,1+ii})
    title(DataSet.Properties.VariableNames{1+ii})    
    xlabel('Speed')
    xlim([3,30])
end
%todas las variables en función del lever%
figure
for ii=1:15
    subplot(4,4,ii)
    plot(DataSet.LeverPosition,DataSet{:,1+ii})
    title(DataSet.Properties.VariableNames{1+ii})    
    xlabel('Lever Position')
    xlim([1,10])
end
%se puede utilizar un control chart para verificar si los datos salen desde
%un cierto parámetro para advertirnos pero eso no funciona en este caso por
%la gran cantidad de datos%
controlchart(DataSet.HPTurbineExitTemperature,'chart','i');
%Se puede usar un DataStore para acceder a la gran cantidad de datos que
%tenemos%
dataFolder='DataSet.xlsx';
ds=datastore(dataFolder);
preview(ds)
%también se puede utilizar el tall array cuando se tienen muchos datos que
%no caben en la memoria del software y matlab se demora en procesar, por lo
%cual, le cambia el tipo de datos%
tallDataAll=tall(ds)
%tambien se puede generar otro workspace donde se filtran ciertos datos%
tallDataUnsup=tallDataAll(tallDataAll.Speed<=30,:);

%ahora podemos agregar mayor cantidad de plots a cada uno de los registros
%de datos que teníamos utilizando la función gather%
samplePlot=datasample(tallDataUnsup,3000,'Replace',false);
samplePlot=gather(samplePlot);
figure
for ii=1:15
    subplot(4,4,ii)
    plot(samplePlot.Speed,samplePlot{:,1+ii})
    title(samplePlot.Properties.VariableNames{1+ii})    
    xlabel('Speed')
    xlim([3,30])
end
%todas las variables en función del lever%
figure
for ii=1:15
    subplot(4,4,ii)
    plot(samplePlot.LeverPosition,samplePlot{:,1+ii})
    title(samplePlot.Properties.VariableNames{1+ii})    
    xlabel('Lever Position')
    xlim([1,10])
end

%visualizar primero los dos componentes principales, sólo con el financial
%toolbox%
figure
binScatterPlot(score(:,1),score(:,2),[50,50],'Gamma',0.01)
axis equal
xlabel('First Principal Component')
ylabel('Second Principal Component')

%ahora que ya hemos observado la data, podemos establecer los diferentes
%modelos de clasificación que existen%
dataClassSample=gather(datasample(tallDataAll,5000,'Replace',false));
summary(dataClassSample)

%ahora podemos clasificarlos y visualizarlos por categorías%
figure
for ii=1:15
    h(ii)=subplot(4,4,ii);%#ok
    scatter(h(ii),dataClassSample.Speed,dataClassSample{:,1+ii},[],dataClassSample,'Filled');
    title(h(ii),dataClassSample.Properties.VariableNames{2+ii})
    xlabel(h(ii),'Time')
    set(h(ii),'CLim',[1 4])
end

%otra forma de hacerlo todo%
DataSet=readtable('DataSet.xlsx','ReadVariableNames',true);
catname = {'Reparacion Urgente','Tomar Precaucion','Operacion Normal'};
label1 = discretize(DataSet.GTCompressorDecayCoefficient, [0.950 0.970 0.985 inf],'categorical',catname);
label2 = discretize(DataSet.GTTurbineDecayCoefficient, [0.975 0.980 0.990 inf],'categorical',catname);
DataSet.Classification_GTCompressor = label1;
DataSet.Classification_GTTurbine = label2;
count_urgente=numel(DataSet.Classification_GTTurbine,DataSet.Classification_GTTurbine=='Reparacion Urgente')
count_precaucion=numel(DataSet.Classification_GTTurbine,DataSet.Classification_GTTurbine=='Tomar Precaucion')
count_normal=numel(DataSet.Classification_GTTurbine,DataSet.Classification_GTTurbine=='Operacion Normal')
TOTAL=count_urgente+count_precaucion+count_normal
%aquí le podemos poner colores a las peores%
figure
for ii = 1:15
    subplot(4,4,ii);
    gscatter(DataSet.Speed, DataSet{:,1+ii}, DataSet.Classification_GTCompressor);
    title(DataSet.Properties.VariableNames{1+ii})
    legend('off');
end
figure
for ii = 1:14
    subplot(4,4,ii);
    gscatter(DataSet.LeverPosition, DataSet{:,1+ii}, DataSet.Classification_GTCompressor);
    title(DataSet.Properties.VariableNames{1+ii})
    legend('off');
end
%tema de financial toolbox nuevamente%
figure
s1 = gscatter(score(:,1), score(:,2), DataSet.Label1);
hold on;
idx = DataSet.Speed == 0;
s2 = plot(score(idx,1), score(idx,2),'rp','MarkerSize',10,'MarkerFaceColor','w');
legend([s1; s2],{'urgent','short','medium','long','failure occurrence'},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);

%mismas condiciones%
idxUnit = DataSet.LeverPosition == 1;
idxFailure = idxUnit & DataSet.Speed == 0;
figure
s1 = gscatter(score(idxUnit,1), score(idxUnit,2), DataSet.Label1(idxUnit));
hold on;
idx = DataSet.Speed == 0;
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

%otra forma de hacerlo todo, pero sólo con el tema de normal y anormal%
DataSet=readtable('DataSet.xlsx','ReadVariableNames',true);
catname = {'Reparacion','Operacion Normal'};
label1 = discretize(DataSet.GTCompressorDecayCoefficient, [0.950 1 inf],'categorical',catname);
label2 = discretize(DataSet.GTTurbineDecayCoefficient, [0.975 1 inf],'categorical',catname);
DataSet.Classification_GTCompressor = label1;
DataSet.Classification_GTTurbine = label2;
%dividir para un set de entrenamiento y otro de prueba%
nrows = size(DataSet,1);
r80 = round(0.80 * nrows);
rand80 = randperm(nrows,r80);
TrainingSet = DataSet(rand80,:);%9547x20 para comprobación%
TestSet = DataSet;
TestSet(rand80,:) = [];%2387x20 para el test posterior%

%aquí le podemos poner colores a las peores%
figure
for ii = 1:15
    subplot(4,4,ii);
    gscatter(TrainingSet.Speed, TrainingSet{:,1+ii}, TrainingSet.Classification_GTCompressor);
    title(TrainingSet.Properties.VariableNames{1+ii})
    legend('off');
end
figure
for ii = 1:14
    subplot(4,4,ii);
    gscatter(TrainingSet.LeverPosition, TrainingSet{:,1+ii}, TrainingSet.Classification_GTCompressor);
    title(TrainingSet.Properties.VariableNames{1+ii})
    legend('off');
end
%tema de financial toolbox nuevamente%
figure
s1 = gscatter(score(:,1), score(:,2), TrainingSet.Label1);
hold on;
idx = DataSet.Speed == 0;
s2 = plot(score(idx,1), score(idx,2),'rp','MarkerSize',10,'MarkerFaceColor','w');
legend([s1; s2],{'urgent','short','medium','long','failure occurrence'},...
    'Color',    [1 1 1],...
    'Location', 'northwest',...
    'FontSize', 12);
xlabel('1st Principal Component','FontSize',12);
ylabel('2nd Principal Component','FontSize',12);

%mismas condiciones%
idxUnit = TrainingSet.LeverPosition == 1;
idxFailure = idxUnit & TrainingSet.Speed == 0;
figure
s1 = gscatter(score(idxUnit,1), score(idxUnit,2), TrainingSet.Label1(idxUnit));
hold on;
idx = TrainingSet.Speed == 0;
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
%para produccion del modelo
saveCompactModel(trainedModel,'MaintenanceClassificationModel');
open MaintenanceClassificationModel.m

    %contar la cantidad de clasificaciones en el modelo predictivo en base al
    %yfit%
    count_urgente3=numel(yfit,yfit=='Reparacion Urgente')
    count_precaucion3=numel(yfit,yfit=='Tomar Precaucion')
    count_normal3=numel(yfit,yfit=='Operacion Normal')
    TOTAL3=count_urgente3+count_precaucion3+count_normal3
    %contar la cantidad de clasificaciones en el modelo previo a ser utilizado
    %como variable predictora%
    count_urgente2=numel(TestSet.Classification_GTTurbine,TestSet.Classification_GTTurbine=='Reparacion Urgente')
    count_precaucion2=numel(TestSet.Classification_GTTurbine,TestSet.Classification_GTTurbine=='Tomar Precaucion')
    count_normal2=numel(TestSet.Classification_GTTurbine,TestSet.Classification_GTTurbine=='Operacion Normal')
    TOTAL1=count_urgente2+count_precaucion2+count_normal2
    %contar etiquetas previo al ingreso al modelo predictivo%
    count_urgente1=numel(TrainingSet.Classification_GTTurbine,TrainingSet.Classification_GTTurbine=='Reparacion Urgente')
    count_precaucion1=numel(TrainingSet.Classification_GTTurbine,TrainingSet.Classification_GTTurbine=='Tomar Precaucion')
    count_normal1=numel(TrainingSet.Classification_GTTurbine,TrainingSet.Classification_GTTurbine=='Operacion Normal')
    TOTAL1=count_urgente1+count_precaucion1+count_normal1
    
    yfit = trainedModel.predictFcn(TestSet) 

    y =Comparatives.GTTurbineDecayCoefficient_True(:,1);
    X = double(hospital(:,2:5));
    
label1 = discretize(Comparatives.GTCompressorDecayCoefficient_True, [0.950 0.970 0.985 inf],'categorical',catname);
label2 = discretize(Comparatives.GTTurbineDecayCoefficient_Predicted, [0.975 0.980 0.990 inf],'categorical',catname);
Comparatives.Classification_GTCompressor2 = label2;
Comparatives.Classification_GTTurbine = label2;
count_urgente2=numel(Comparatives.Classification_GTTurbine2,Comparatives.Classification_GTTurbine2=='Reparacion Urgente')
count_precaucion2=numel(Comparatives.Classification_GTTurbine2,Comparatives.Classification_GTTurbine2=='Tomar Precaucion')
count_normal2=numel(Comparatives.Classification_GTTurbine2,Comparatives.Classification_GTTurbine2=='Operacion Normal')
TOTAL=count_urgente2+count_precaucion2+count_normal2