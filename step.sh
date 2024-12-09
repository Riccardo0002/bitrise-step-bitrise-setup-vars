#!/bin/bash
set -ex

# make pipelines' return status equal the last command to exit with a non-zero status, or zero if all commands exit successfully
set -o pipefail


if [ ! -z "$ENVIRONMENT" ] ; then
  envman add --key APP_CONFIG_ENVIRONMENT --value "$ENVIRONMENT"
  envman add --key APP_MAIN --value "lib/main_$ENVIRONMENT.dart"
fi

if [ ! -z "$SEMANTICS_DEBUGGER_ENABLED" ] ; then
  envman add --key APP_SEMANTICS_DEBUGGER_ENABLED --value "$SEMANTICS_DEBUGGER_ENABLED"
fi

if [ ! -z "$ENABLE_ANTI_TAMPERING" ] ; then
  envman add --key APP_ENABLE_ANTI_TAMPERING --value "$ENABLE_ANTI_TAMPERING"
fi

if [ ! -z "$DISABLE_CERT_PINNING" ] ; then
  envman add --key APP_DISABLE_CERT_PINNING --value "$DISABLE_CERT_PINNING"
fi

if [ ! -z "$TYPE" ] ; then
    envman add --key TYPE --value "$BITRISE_BUILD_NUMBER"
    echo "TYPE var set"
fi

if [ -z "$BUILD_NUMBER" ] ; then
    envman add --key BUILD_NUMBER --value "$BITRISE_BUILD_NUMBER"
fi

echo "------------------------------------------------------------------"
echo "APP_CONFIG_ENVIRONMENT: $APP_CONFIG_ENVIRONMENT"
echo "APP_MAIN: $APP_MAIN"
echo "APP_SEMANTICS_DEBUGGER_ENABLED: $APP_SEMANTICS_DEBUGGER_ENABLED"
echo "APP_ENABLE_ANTI_TAMPERING: $APP_ENABLE_ANTI_TAMPERING"
echo "APP_DISABLE_CERT_PINNING: $APP_DISABLE_CERT_PINNING"
echo "BUILD_NUMBER: $BUILD_NUMBER"
echo "TYPE: $TYPE"
echo "------------------------------------------------------------------" 