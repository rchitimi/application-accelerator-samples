#!/bin/bash
set -euxo pipefail

pushd $1
grype=$2

./mvnw package -DskipTests
$grype target/testcoords-0.0.1-SNAPSHOT.jar --fail-on high --config ${GITHUB_WORKSPACE}/.github/tests/.grype.yaml

popd