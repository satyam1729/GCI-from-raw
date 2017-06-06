clear;
%add in_dir with a trailing '/' like '/home/computer/'
in_directory='/home/satyam/code/summer-2017/TTS/data/HTS-demo_CMU-ARCTIC-SLT/data/raw/';
out_directory='/home/satyam/code/summer-2017/TTS/data/HTS-demo_CMU-ARCTIC-SLT/data/xframe';
abc=strcat(in_directory,'*.raw');
filelist=dir(abc);
sz=size(filelist);
filenames=strings(sz);
filenames=strcat(in_directory,filelist.name);
for i = 1:numel(filelist)

end
 
