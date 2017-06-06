clear;
%----------------------------------add dir info---------------------------
%replace with input dirctory containing raw audio files with a trailing '/'
%example could be '/home/computer/'
in_directory='/home/satyam/code/summer-2017/TTS/data/HTS-demo_CMU-ARCTIC-SLT/data/raw/';
%replace with output directories with a trailing '/' that should contain 
%the .mat files(for xframe and bframe) corresponding to each .raw files
out_directory1='/home/satyam/code/summer-2017/TTS/data/HTS-demo_CMU-ARCTIC-SLT/data/xframe/';
out_directory2='/home/satyam/code/summer-2017/TTS/data/HTS-demo_CMU-ARCTIC-SLT/data/bframe/';
mkdir(out_directory1);
mkdir(out_directory2);
%-------------------------------------------------------------------------
fs=48000;%sampling frequency
Nw=1440;%window duration is 30ms
Ns=240;%shift duration is 5 ms

filenames=strcat(in_directory,'*.raw');
filelist=dir(filenames);
in_name = {filelist.name};
out_name_x=strcat(out_directory1,strtok(in_name, '.'),'.mat');
out_name_b=strcat(out_directory2,strtok(in_name, '.'),'.mat');
in_name=strcat(in_directory,in_name);
 for i = 1:numel(filelist)
    fid=fopen(char(in_name(i))); 
    c=fread(fid,'int16');%the array for speech file as int16
    c=c./max(abs(c));
    [~, GCIs] = GEFBA(c,fs);
    b=zeros(length(c),1);
    b(GCIs)=1;
    [ frames_x, ~ ] = vec2frames( c, Nw, Ns);
    [ frames_b, ~ ] = vec2frames( b, Nw, Ns);
    save(char(out_name_x(i)),'frames_x');
    save(char(out_name_b(i)),'frames_b');
 end   
