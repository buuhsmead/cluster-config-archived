#!/usr/bin/env bash

export RHSSO_PROJECT_NAME=rhsso

export RHSSO_INTERNAL_URL=$(oc get keycloak -l app=rhsso -o json -n ${RHSSO_PROJECT_NAME} | jq -r '.items[0].status.internalURL')

export RHSSO_EXTERNAL_URL=$(oc get keycloak -l app=rhsso -o json -n ${RHSSO_PROJECT_NAME} | jq -r '.items[0].status.externalURL')

export RHSSO_CREDENTIAL_SECRET=$(oc get keycloak -l app=rhsso -o json -n ${RHSSO_PROJECT_NAME} | jq -r '.items[0].status.credentialSecret')

export RHSSO_ADMIN_USERNAME=$(oc get secret ${RHSSO_CREDENTIAL_SECRET} -o json -n ${RHSSO_PROJECT_NAME} | jq -r '.data.ADMIN_USERNAME' | base64 -d)

export RHSSO_ADMIN_PASSWORD=$(oc get secret ${RHSSO_CREDENTIAL_SECRET} -o json -n ${RHSSO_PROJECT_NAME} | jq -r '.data.ADMIN_PASSWORD' | base64 -d)

echo "**********************"
echo " NAMESPACE: ${RHSSO_PROJECT_NAME}"
echo " INT URL  : ${RHSSO_INTERNAL_URL}"
echo " EXT URL  : ${RHSSO_EXTERNAL_URL}"
echo " USERNAME : ${RHSSO_ADMIN_USERNAME}"
echo " PASSWORD : ${RHSSO_ADMIN_PASSWORD}"
echo "**********************"
