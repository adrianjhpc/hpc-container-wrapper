set -e
set -u
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $SCRIPT_DIR/common_functions.sh
source $CW_BUILD_TMPDIR/_vars.sh

print_info "Installing to $CW_INSTALLATION_PREFIX" 1

if [[ ${CW_UPDATE_INSTALLATION+defined } && "$CW_UPDATE_INSTALLATION" == "yes" ]];then
    rm -fr $CW_INSTALLATION_PREFIX/bin
    rm -fr $CW_INSTALLATION_PREFIX/_bin
    rm -fr $CW_INSTALLATION_PREFIX/share
fi
    cp -a $CW_BUILD_TMPDIR/_deploy/* $CW_INSTALLATION_PREFIX/
    mkdir -p $CW_INSTALLATION_PREFIX/share
    cp -a $CW_BUILD_TMPDIR/*.yaml  $CW_INSTALLATION_PREFIX/share

rm -rf $CW_BUILD_TMPDIR
