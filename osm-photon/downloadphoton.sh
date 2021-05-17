
set -x

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

latest=$(get_latest_release "komoot/photon")
wget -nv https://github.com/komoot/photon/releases/download/$latest/photon-$latest.jar -O photon.jar

exit 0
