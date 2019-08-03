#!/usr/bin/env bash
#!/usr/bin/bash
# build commands will not be executed upon installing through conda
# mkdir build
# mcc -C -o PAM -W main:PAM -T link:exe -d build -v Launcher.m -a ./functions/Custom_Read_Ins -a ./images -a Models -a ./functions/bfmatlab/bioformats_package.jar -I "functions" -I "functions/BurstBrowser" -I "functions/BurstBrowser/colormaps" -I "functions/BurstBrowser/kinetic_consistency_check" -I "functions/BurstBrowser/regression" -I "functions/BurstBrowser/unimplemented" -I "functions/Custom_Read_Ins" -I "functions/FCSFit" -I "functions/GUI" -I "functions/MEXfiles" -I "functions/MIA" -I "functions/MIA/RICSPE" -I "functions/MIA/RICSPE/Profiles" -I "functions/MIA/ReadIn" -I "functions/PAM" -I "functions/PDAFit"  -I "functions/PDAFit/dynamic_sim" -I "functions/PDAFit/likelihoods_2C" -I "functions/PDAFit/randist" -I "functions/PDAFit/randist/specfunc" -I "functions/PDAFit/randist/sys" -I "functions/Phasor" -I "functions/TauFit" -I "functions/bfmatlab" -I "functions/readin"  -I "functions/tools" -I "functions/tools/conversion" -I "functions/tools/conversion/excel" -I "functions/tools/conversion/measures" -I "functions/tools/conversion/temperature" -I "functions/tools/file operations" -I "functions/tools/java"
# cd build

######################################
# Install MATLAB Runtime engine
# TODO: manage that only the minimum needed parts of the MATLAB Runtime engine are installed

# for now, we expect the user to install the runtime themselves
# Get the Runtime
# mkdir temp
# wget http://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/4/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019a_Update_4_glnxa64.zip
# cp /home/thomas/temp/MATLAB_Runtime_*_glnxa64.zip ./temp/
# cd temp
# unzip MATLAB_Runtime_*_glnxa64.zip
# cd ..

# mkdir runtime
# ./temp/install -agreeToLicense yes -mode silent -destinationFolder "$PWD"/runtime
# rm -rf temp
# cd ..
