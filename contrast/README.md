# Contrast Security Concourse tasks

## Setup

These tasks need credentials and connection details for your Contrast instance. An [API-Only service account](https://support.contrastsecurity.com/hc/en-us/articles/4416513347988-How-To-create-an-API-Only-service-account) is strongly encouraged.

The file `contrast-cli-secret.yaml.tpl` contains a Kubernetes secret definition that may help if you are using the Concourse [Kubernetes Credentials Manager](https://concourse-ci.org/kubernetes-credential-manager.html)

The credentials should be defined as:
  - `contrast-cli-creds.api_key`
  - `contrast-cli-creds.authorization`
  - `contrast-cli-creds.org_uuid`
  - `contrast-cli-creds.service_key`
  - `contrast-cli-creds.url`
  - `contrast-cli-creds.username`

## Tasks

This folder contains the following tasks:

## [contrast-cli.yml](contrast-cli.yml)

Installs the Contrast CLI and executes `contrast audit` on the `src` folder to submit the SCA results to Contrast.

Optionally runs `contrast scan`, zipping and **uploading** the `src` folder to Contrast to submit a SAST Scan. If source code should not be uploaded to Contrast, use this task only for Contrast SCA, adding the local scanner task below for SAST.

### Inputs
Pass your source code repository to the input named `src`.


### Parameters

| Name | Description | Required |
| -----| ------------|--------- |
|CONTRAST_PROJECT_NAME|Name of the project which will show in Contrast on the Projects & Scans tabs.|Yes|
|CONTRAST_UPLOAD_SOURCE_SAST_SCAN|Set to true if you want the contents of `src` to be uploaded to Contrast triggering a SAST scan.|No, defaults to false (skip scan)|

### Outputs
The `contrast-output` folder will contain the SBOM generated from Contrast SCA, and, if you enabled scan upload, the Scan SARIF file.

## [contrast-local-scanner.yml](contrast-local-scanner.yml)

Downloads the Contrast local SAST scanner and starts a scan of the `src` folder locally, on the worker node, submitting only the results to Contrast. Source code is not uploaded.

### Inputs
Pass your source code repository to the input named `src`.

### Parameters

| Name | Description | Required |
| -----| ------------|--------- |
|CONTRAST_PROJECT_NAME|Name of the project which will show in Contrast on the Scans tab.|Yes|

### Outputs
The `contrast-output` folder will contain the Scan SARIF file.
