function [] = smooth(func_targetdir, funct_file, FWHM, sub_name)

%% Running smoothing.

%func_targetdir: path to NIfTI functional data: func_targetdir(i,1)
%funct_file: file output from the previous func step; i.e. normalize: '^wrof4D.*\.*'
%FWHM: 2.5 x voxel size; in this example: [8 8 8]
%sub_name: name current subject: sbj_fold(i).name

%% REMARK: do not forget to change the FWHM (2.5x voxel size)!
%%

do_smooth = 1;

if do_smooth
        clear matlabbatch;
        ibatch=1;      
        
        matlabbatch{ibatch}.spm.spatial.smooth.data = cellstr(spm_select('ExtFPList', func_targetdir, funct_file, Inf));
        matlabbatch{ibatch}.spm.spatial.smooth.fwhm = FWHM;
        disp('Running smoothing with SPM batch ----');
        disp(sprintf(sub_name));
        disp('     ----      ');
        spm_jobman('run',matlabbatch);
        disp('Smoothing done!');
end
end