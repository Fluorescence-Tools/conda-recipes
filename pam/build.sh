#!/usr/bin/env bash
#!/usr/bin/bash

######################################
# Install MATLAB Runtime engine

if [[ $(uname -s) == Darwin ]] # MacOS
then 
    # check if the runtime is installed
    MATLAB_RUNTIME_PATH=/Applications/MATLAB/MATLAB_Runtime/v94
    if [ -d "$MATLAB_RUNTIME_PATH" ]
        then
            echo "MATLAB runtime at $MATLAB_RUNTIME_PATH exists."
        else
            # Get the Runtime
            echo "Installing MATLAB runtime..."

            mkdir -p temp
            cd temp

            curl http://ssd.mathworks.com/supportfiles/downloads/R2018a/deployment_files/R2018a/installers/maci64/MCR_R2018a_maci64_installer.dmg.zip -o MATLAB_runtime.zip

            unzip MATLAB_runtime.zip

            hdiutil attach -quiet MCR_R*.dmg

            /Volumes/MCR_R*/InstallForMacOSX.app/Contents/MacOS/InstallForMacOSX -agreeToLicense yes -mode silent -destinationFolder /Applications/MATLAB/MATLAB_Runtime/

            hdiutil detach -quiet /Volumes/MCR_R*

            cd ..
            rm -rf temp
    fi


    # check if environment variable DYLD_LIBRARY_PATH is set
    if [ -z "$DYLD_LIBRARY_PATH" ]
        then
            # it's not set
            echo "Setting up DYLD_LIBRARY_PATH for MATLAB runtime in $MATLAB_RUNTIME_PATH"
            echo '' >> ~/.bash_profile
            echo '# MATLAB runtime path' >> ~/.bash_profile
            echo "export DYLD_LIBRARY_PATH='$MATLAB_RUNTIME_PATH/runtime/maci64:$MATLAB_RUNTIME_PATH/sys/os/maci64:$MATLAB_RUNTIME_PATH/bin/maci64:$MATLAB_RUNTIME_PATH/extern/bin/maci644'" >> ~/.bash_profile
    fi
                        
    # unpack and copy PAM
    cp -Rf PAM.app /Applications/

    echo "PAM was installed to /Applications."

else # Linux
    # check if the runtime is installed
    MATLAB_RUNTIME_PATH="$HOME/MATLAB_Runtime/v94"
    if [ -d "$MATLAB_RUNTIME_PATH" ]
        then
            echo "MATLAB runtime at $MATLAB_RUNTIME_PATH exists."
        else
            # Get the Runtime
            echo "Installing MATLAB runtime..."

            mkdir -p temp
            cd temp

            wget http://ssd.mathworks.com/supportfiles/downloads/R2018a/deployment_files/R2018a/installers/glnxa64/MCR_R2018a_glnxa64_installer.zip -O MATLAB_runtime.zip

            unzip MATLAB_runtime.zip

            ./install -agreeToLicense yes -mode silent -destinationFolder "$HOME/MATLAB_Runtime"

            cd ..
            rm -rf temp

            # check if environment variable DYLD_LIBRARY_PATH is set
            if [ -z "$DYLD_LIBRARY_PATH" ]
                then
                    # it's not set
                    echo "Setting up DYLD_LIBRARY_PATH for MATLAB runtime in $MATLAB_RUNTIME_PATH"
                    echo '' >> ~/.bashrc
                    echo '# MATLAB runtime path' >> ~/.bashrc
                    echo "export DYLD_LIBRARY_PATH='$MATLAB_RUNTIME_PATH/runtime/maci64:$MATLAB_RUNTIME_PATH/sys/os/maci64:$MATLAB_RUNTIME_PATH/bin/maci64:$MATLAB_RUNTIME_PATH/extern/bin/maci644'" >> ~/.bashrc
            fi
    fi
   
    mkdir -p "$HOME/PAM"
    # unpack and copy PAM
    cp -Rf PAM.app "$HOME/PAM"

    echo "PAM was installed to $HOME/PAM."    
fi
