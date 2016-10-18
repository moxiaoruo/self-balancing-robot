currentFolder = pwd;
aimFolder='\kernel';
setenv('TTKERNEL', strcat(currentFolder,aimFolder))
addpath([getenv('TTKERNEL')])
addpath([getenv('TTKERNEL') '/matlab/help'])
addpath([getenv('TTKERNEL') '/matlab'])
