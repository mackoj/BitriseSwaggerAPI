# Pull this image
docker pull hawkci/swaggen:latest

declare DOCKER_MOUNTED_PATH="/tmp/workdir"

# Run swaggen
#   - This assumes your spec file is in $(pwd)/spec.json
#   - Generated code will be available in $(pwd)/swaggen-output

docker run                                                              \
  --rm                                                                  \
  -v "$(pwd):${DOCKER_MOUNTED_PATH}"                                    \
  hawkci/swaggen:latest                                                 \
  swaggen generate "${DOCKER_MOUNTED_PATH}/swagger.yml"                 \
  --language swift                                                      \
  --template "${DOCKER_MOUNTED_PATH}/Templates/Swift/template.yml"      \
  --destination "${DOCKER_MOUNTED_PATH}/Generated/Swift"                \
  --clean all                                                           \
  --verbose

rm -rf *.podspec Cartfile Info.plist Package.swift README.md Sources
mv Generated/Swift/* .
rm -rf Generated
