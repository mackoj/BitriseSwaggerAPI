swaggen generate "swagger.yml"              \
  --language swift                          \
  --template "Templates/Swift/template.yml" \
  --destination "generate"                  \
  --clean all                               \
  --verbose

rm -rf BitriseAPI.podspec Cartfile Info.plist Package.swift README.md Sources
mv generate/* .
rm -rf generate
