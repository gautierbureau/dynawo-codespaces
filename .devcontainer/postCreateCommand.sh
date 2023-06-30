#!/bin/bash

echo '#!/bin/bash

export DYNAWO_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export DYNAWO_SRC_OPENMODELICA="$DYNAWO_HOME"/OpenModelica/Source
export DYNAWO_INSTALL_OPENMODELICA=/opt/dynawo/OpenModelica
export DYNAWO_THIRD_PARTY_INSTALL_DIR=/opt/dynawo

export DYNAWO_LOCALE=en_GB
export DYNAWO_RESULTS_SHOW=false
export DYNAWO_BROWSER=lynx

[ -z "$DYNAWO_NB_PROCESSORS_USED" ] && export DYNAWO_NB_PROCESSORS_USED=2

export DYNAWO_BUILD_TYPE=Debug

export DYNAWO_PYTHON_COMMAND=python3

export libiidm_DIR=/opt/dynawo/share/cmake
export CMAKE_PREFIX_PATH=/opt/dynawo/cmake/:/opt/dynawo/share/cmake

"$DYNAWO_HOME"/util/envDynawo.sh $@' > myEnvDynawo.sh
chmod +x myEnvDynawo.sh
#./myEnvDynawo.sh deploy-autocompletion --deploy
sudo chmod -R 777 /opt
cd /opt
curl -LO https://github.com/dynawo/dynawo/releases/download/nightly/Dynawo_omc_V1.6.0.zip
unzip Dynawo_omc_V1.6.0.zip
rm -f Dynawo_omc_V1.6.0.zip
cd dynawo
rm -rf bin ddb dynawo.sh dynawoEnv.txt examples sbin
rm -rf share/DYN* share/dynawo-* share/dictionaries_mapping.dic share/solvers.par
rm -rf share/cmake/Find* share/cmake/CPUCount.cmake
rm -rf include/DYD* include/DYN* include/TL* include/JOB* include/PAR* include/CSTR* include/EXTVAR* include/CRV* include/CRT* include/FSV* include/LEQ* include/Modelica*
rm -rf lib/dynawo_* lib/libdynawo_* lib/libModelica_externalC.so
ln -s /opt/dynawo/ /opt/dynawo/adept
ln -s /opt/dynawo/ /opt/dynawo/xerces-c
ln -s /opt/dynawo/ /opt/dynawo/suitesparse
ln -s /opt/dynawo/ /opt/dynawo/sundials
ln -s /opt/dynawo/ /opt/dynawo/libxml2
ln -s /opt/dynawo/ /opt/dynawo/libzip
