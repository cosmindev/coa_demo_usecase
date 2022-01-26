#!/bin/bash

pip install requests
pip install pyyaml

echo "${API_CREDS}" > ${GITHUB_WORKSPACE}/api_creds.yaml

export LISTING_ID=$(grep -e listingId "${GITHUB_WORKSPACE}/${LISTING_DIR}/marketplace/metadata.yaml" 2> /dev/null | grep -oe [0-9]*)
export ZIP_FILE=$(ls ${GITHUB_WORKSPACE}/upload 2> /dev/null)
export ZIP_PATH=${GITHUB_WORKSPACE}/upload
export OCID=$(cat ${GITHUB_WORKSPACE}/ocid.txt 2> /dev/null)

cp "${GITHUB_WORKSPACE}/${LISTING_DIR}/marketplace/metadata.yaml" ${GITHUB_WORKSPACE}/metadata.yaml
cp "${GITHUB_WORKSPACE}/${LISTING_DIR}/marketplace/icon.png" ${GITHUB_WORKSPACE}/icon.png

pushd ${GITHUB_WORKSPACE}
export COMMIT_HASH=$(git rev-parse HEAD | cut -c1-6)
popd

if [ -z "$LISTING_ID" ] || [ "$LISTING_ID" = "0" ]
then
    if [ -z "$OCID" ]
    then
        echo "python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action create_listing -fileName $ZIP_PATH/$ZIP_FILE -commitHash $COMMIT_HASH"
        python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action create_listing -fileName $ZIP_PATH/$ZIP_FILE -commitHash $COMMIT_HASH
    else
        echo "python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action create_listing -imageOcid $OCID"
        python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action create_listing -imageOcid $OCID
    fi
else
    if [ -z "$OCID" ]
    then
        echo "python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action update_listing -fileName $ZIP_PATH/$ZIP_FILE -commitHash $COMMIT_HASH"
        python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action update_listing -fileName $ZIP_PATH/$ZIP_FILE -commitHash $COMMIT_HASH
    else
        echo "python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action update_listing -imageOcid $OCID"
        python /mpctl.py -credsFile ${GITHUB_WORKSPACE}/api_creds.yaml -action update_listing -imageOcid $OCID
    fi
fi
