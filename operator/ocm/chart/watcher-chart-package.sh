#!/usr/bin/env bash

MAKEFILE_PATH=../../
HELM_PACKAGE_PATH=$(pwd)
HELM_CHART_PATH=$(pwd)/kyma-watcher

# render kustomize manifests and copy them to templates folder for helm package
cd "${MAKEFILE_PATH}"
make helm-prepare

# package helm chart
helm package "${HELM_CHART_PATH}" -d "${HELM_PACKAGE_PATH}"