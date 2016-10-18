function set_up_project()
%set_up_project  Configure the environment for this project
%
%   Set up the environment for the current project. This function is set to
%   Run at Startup.

%   Copyright 2011-2014 The MathWorks, Inc.

% Use Simulink Project API to get the current project:
project = simulinkproject;
projectRoot = project.RootFolder;

% Set the location of slprj to be the "work" folder of the current project:
currentFolder = projectRoot;
aimFolder='\lib\truetime-2.0-beta-10.2';
cd(strcat(currentFolder,aimFolder));
init_truetime;
cd(projectRoot);
currentFolder = projectRoot;
aimFolder='\lib\SM_Contact_Forces_Lib_3p0_14b';
cd(strcat(currentFolder,aimFolder));
startup_Contact_Forces;
% uigetdir(currentFolder);
cd(projectRoot);


% myCacheFolder = fullfile(projectRoot, 'work');
% if ~exist(myCacheFolder, 'dir')
%     mkdir(myCacheFolder)
% end
% Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
%    'CodeGenFolder', myCacheFolder);

% Change working folder to the "work" folder:

end

