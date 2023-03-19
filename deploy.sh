# Set Global Variables
region_location="westeurope"
rg_name="Rg4Blob001"
templateFile="create_blob.json"
blob_storage_name="pkon4ever2"

# Create Resource Group
az group create \
    --name $rg_name \
    --location $region_location


# Create Blob Storage using ARM Template
az deployment group create \
    --name create_blob \
    --resource-group $rg_name \
    --template-file $templateFile \
    --parameters storageName=$blob_storage_name
