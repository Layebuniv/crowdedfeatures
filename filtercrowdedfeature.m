%% filter crowded feaures algorithms
% Abdesslem Layeb 
% citation: Abdesslem Layeb:Two novel feature selection algorithms based on crowding distance
%https://arxiv.org/abs/2105.05212
% LISIA lab., Computer science and its application department, 
%NTIC faculty, university of Constantine 2
%abdesslem.layeb@univ-constantine2.dz
%%

clear;
clc;
 
 
% read dataset:Xdata,Xtarget
load 'breast_cancer'
Nf=10; % select 10 features

% load 'ovarian'
%  Nf=150; % select 150 features
% 
%%normalisation
%Xdata= (Xdata-min(Xdata(:))) ./ (max(Xdata(:)))-min(Xdata(:));


[m,n]=size(Xdata);
% compute the crowding distance of the features
crowdingDistance=distancecrowding([],Xdata');
%sort the corwding distances
[res,ind]=sort(crowdingDistance,'descend'); 
 
indfeat=ind(1:Nf); % selected feature
kfold=5;           %  cross validation 

 Acc = Eval(Xdata(:,indfeat),Xtarget,kfold);   %  classifier evaluation 
 disp(['accuracy=' num2str(Acc)]);
  disp([ ' nbr of features = ' num2str(Nf)    ]);
  disp(['selected features: '  num2str(indfeat')]) ;
 