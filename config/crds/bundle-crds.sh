#!/usr/bin/env bash

# This script bundles CRDs to be used for releases.


echo "Yo: script base: $(dirname "${0}") pwd=${PWD}" > /tmp/debug

CRDS_DIR=$(dirname "${0}")

ls -al >> /tmp/debug
CRDS_FILE="${CRDS_DIR}/crds-kcp-specific.yaml"
rm -f ${CRDS_FILE}
for file in ${CRDS_DIR}/apis.kcp.*.yaml ${CRDS_DIR}/cache.kcp.*.yaml \
            ${CRDS_DIR}/core.kcp.*.yaml ${CRDS_DIR}/tenancy.kcp.*.yaml \
            ${CRDS_DIR}/topology.kcp.*.yaml; do
    cat ${file} >> "${CRDS_FILE}"
    echo "--" >> "${CRDS_FILE}"
    echo ${file} >> /tmp/debug
done

