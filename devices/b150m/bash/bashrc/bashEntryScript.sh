cd () { builtin cd "$@" && chpwd; }
pushd () { builtin pushd "$@" && chpwd; }
popd () { builtin popd "$@" && chpwd; }
# unset_all_project_settings () {
  # do whatever it takes to undo the effect of projectSettings.bash,
  # e.g. unset variables, remove PATH elements, etc.
# }
chpwd () {
  case $PWD in
    /home/torsho/ekyc-native-app) 
        sdk use java 11.0.12-open;;
    # *) unset_all_project_settings;;
  esac
}

