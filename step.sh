#!/bin/bash
set -ex

# make pipelines' return status equal the last command to exit with a non-zero status, or zero if all commands exit successfully
set -o pipefail

envman add --key APP_CONFIG_ENVIRONMENT --value "$ENVIRONMENT"

envman add --key APP_MAIN --value "lib/main_$ENVIRONMENT.dart"

envman add --key APP_SEMANTICS_DEBUGGER_ENABLED --value "$SEMANTICS_DEBUGGER_ENABLED"

envman add --key APP_ENABLE_ANTI_TAMPERING --value "$ENABLE_ANTI_TAMPERING"

envman add --key APP_DISABLE_CERT_PINNING --value "$DISABLE_CERT_PINNING"

envman add --key BRAND --value "$BRAND"

envman add --key BUILD_NUMBER --value "$BITRISE_BUILD_NUMBER"

echo "------------------------------------------------------------------"
echo "APP_CONFIG_ENVIRONMENT: $APP_CONFIG_ENVIRONMENT"
echo "APP_MAIN: $APP_MAIN"
echo "APP_SEMANTICS_DEBUGGER_ENABLED: $APP_SEMANTICS_DEBUGGER_ENABLED"
echo "APP_ENABLE_ANTI_TAMPERING: $APP_ENABLE_ANTI_TAMPERING"
echo "APP_DISABLE_CERT_PINNING: $APP_DISABLE_CERT_PINNING"
echo "BUILD_NUMBER: $BUILD_NUMBER"
echo "BRAND: $BRAND"
echo "------------------------------------------------------------------" 