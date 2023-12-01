#!/bin/bash

# Define variables
SCRATCH_ORG_ALIAS="crmDashboard_JT_Dev"
SCRATCH_DEF_FILE="config/project-scratch-def.json"
TEST_DATA_FILE="data/sampleTestData.csv"
PERMISSION_SET="MyCustomPermissionSet"

# Function to create a new Scratch Org
createScratchOrg() {
    echo "Creating new Scratch Org..."
    sfdx force:org:create -f $SCRATCH_DEF_FILE -a $SCRATCH_ORG_ALIAS -s
}

# Function to push source code to the Scratch Org
pushSourceCode() {
    echo "Pushing source code to the Scratch Org..."
    sfdx force:source:push -u $SCRATCH_ORG_ALIAS
}

# Function to import test data
importTestData() {
    echo "Importing test data..."
    sfdx force:data:tree:import -u $SCRATCH_ORG_ALIAS -f $TEST_DATA_FILE
}

# Function to assign a permission set
assignPermissionSet() {
    echo "Assigning permission set..."
    sfdx force:user:permset:assign -u $SCRATCH_ORG_ALIAS -n $PERMISSION_SET
}

# Main script execution
createScratchOrg
pushSourceCode
importTestData
assignPermissionSet

echo "Scratch Org setup complete."
