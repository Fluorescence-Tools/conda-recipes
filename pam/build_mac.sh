#!/usr/bin/env bash
#!/usr/bin/bash

######################################
# Install MATLAB Runtime engine
# TODO: manage that only the minimum needed parts of the MATLAB Runtime engine are installed

# for now, we expect the user to install the runtime themselves
# Get the Runtime

while true; do
    DEFAULT="n"
    read -e -p "Download and install the MATLAB runtime? (y/N) " yn
    yn="${yn:-${DEFAULT}}"
    case $yn in
        [Yy]* )
            mkdir temp
            cd temp

            curl http://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/4/deployment_files/installer/complete/maci64/MATLAB_Runtime_R2019a_Update_4_maci64.dmg.zip -o MATLAB_runtime.zip

            unzip MATLAB_runtime.zip

            hdiutil attach -quiet MATLAB_Runtime_R*.dmg

            /Volumes/MATLAB_Runtime_R*/InstallForMacOSX.app/Contents/MacOS/InstallForMacOSX -agreeToLicense yes -mode silent -destinationFolder /Applications/MATLAB/MATLAB_Runtime/

            hdiutil detach -quiet /Volumes/MATLAB_Runtime_R*

            cd ..
            rm -rf temp

            while true; do
                DEFAULT="y"
                read -p "Set the DYLD_LIBRARY_PATH environment variable? This will allow you to launch PAM directly from the App. (Y/n) " yn
                yn="${yn:-${DEFAULT}}"
                case $yn in
                    [Yy]* )
                        echo '' >> ~/.bash_profile
                        echo '# MATLAB runtime path' >> ~/.bash_profile
                        echo "export DYLD_LIBRARY_PATH='/Applications/MATLAB/MATLAB_Runtime/v96/runtime/maci64:/Applications/MATLAB/MATLAB_Runtime/v96/sys/os/maci64:/Applications/MATLAB/MATLAB_Runtime/v96/bin/maci64:/Applications/MATLAB/MATLAB_Runtime/v96/extern/bin/maci644'" >> ~/.bash_profile
                        break;;
                    [Nn]* ) 
                        echo "Please see the readme.txt for how to launch PAM."
                        break;;
                    * ) 
                        echo "Please answer yes or no.";;
                esac
            done

            break;;
        [Nn]* )
            echo "Please install it manually."
            break;;
        * )
            echo "Please answer yes or no.";;
    esac
done

# unpack and copy PAM
cp -R PAM.app /Applications/

echo "PAM was installed to /Applications."
