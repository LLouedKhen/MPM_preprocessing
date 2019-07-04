
clear; clc;


DataPath = '/Volumes/SONY_32X/data_CP_geneva/Test';
tbxVBQPath = '/Users/sysadmin/Documents/MATLAB/spm12/toolbox/VBQ';

addpath(genpath(DataPath))
addpath(genpath(tbxVBQPath))

cd(DataPath)
Subjects = dir('S0*');
SubjName = {};
for i = 2:length(Subjects)
    SubjName{i} = Subjects(i).name;
end

for i =2:length(SubjName)
    thisSubj= SubjName{i};
    thisSubjPath = fullfile(DataPath, thisSubj);
    cd(thisSubjPath)
    thisSubjPath1 = fullfile(thisSubjPath, 'DICOM');
    cd(thisSubjPath1)
    next = dir('dcm*');
    thisSubjPath2 = fullfile(thisSubjPath1, next.name);
    cd(thisSubjPath2)
    %%
    thisSubjMPMPath =fullfile(thisSubjPath2, 'MPM');
   
    Files = dir;
    FileNames = {};
   
%     for j = 3:length(Files)
%     FileNames{j} = Files(j).name;
%     thisSubjThisSeqPath = fullfile(thisSubjPath2, FileNames{j});
%     cd(thisSubjThisSeqPath)
%     filesHere = dir;
%      if length(filesHere) == 178
%         if ~exist('MPM', 'dir')
%             mkdir MPM
%         end
%          copyfile('thisSubjThisSeqPath', 'MPM\thisSubjThisSeqPath')
%  
%      else
%         continue
%      end
%     end
%    

      cd(thisSubjMPMPath)
      thisSubjMPMs = dir;
      for k =3:length(thisSubjMPMs)
          thisSubjMPMsName = thisSubjMPMs(k).name;
          thisSubjThisMPM = fullfile(thisSubjMPMPath, thisSubjMPMsName);
          cd(thisSubjThisMPM)
          mkdir niftiANDjson
%           if ~exist('niftiANDjson', 'dir')
%             mkdir niftiANDjson
%           end
          Here = pwd;
          There = fullfile(pwd, 'niftiANDjson');
          cd(tbxVBQPath)
          echoOut = GetImgFromMosaic(There, Here);    
      end
   
end