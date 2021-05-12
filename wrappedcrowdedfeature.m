%% filter crowded feaures algorithms
% Abdesslem Layeb 
% citation: Abdesslem Layeb:Two novel features selection algorithms based on crowding distance
%https://arxiv.org/abs/2105.05212
% LISIA lab., Computer science and its application department, 
%NTIC faculty, university of Constantine 2
%abdesslem.layeb@univ-constantine2.dz

clear;
clc;
 
 
% read dataset:Xdata,Xtarget
load 'breast_cancer'
Nf=10; % select 10 features

%load 'ovarian'
 %Nf=150; % select 150 features

%Xdata= (Xdata-min(Xdata(:))) ./ (max(Xdata(:)))-min(Xdata(:));
%%normalisation

[m,n]=size(Xdata);
% compute the crowding distance of the features
crowdingDistance=distancecrowding([],Xdata');
%sort the corwding distances
[res,ind]=sort(crowdingDistance,'descend'); 
 
bestfit=1000;
bestnfeat=ind;  % save the best features indices
indfeat=[];        % selected features vector
kfold=5;           %  cross validation 

for it=1:n 
indfeat(end+1)=ind(it);   % add the feature having rank it in the ordred feature ind
fitness = -Eval(Xdata(:,indfeat),Xtarget,kfold) ;  % evalute the current set of features
%update the best solution
if fitness <bestfit
 bestfit=fitness;
 bestnfeat=indfeat;
 disp(['accuracy=' num2str(-bestfit*100) ', nbr of features = ' num2str(length(bestnfeat))   ]);
   
% %set accuracy threshold if you want to break early
%  if fitness<-0.92
%      break;
%  end
else
    % discard the feature
      indfeat(end)=[];
    
end

end

disp(['Best accuracy=' num2str(-bestfit*100)]);
  disp([ ' nbr of features = ' num2str(length(bestnfeat))    ]);
  disp(['selected features: '  num2str(indfeat)]) ;