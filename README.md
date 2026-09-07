# your-project-name

This repo template allows you to create a repo for your project pipelines

## How to use this template

You need to create before in infra this resources:

* vm agent
* key vault

You need to add to the key vault at least this secrets:

* azure-devops-github-ro-TOKEN
* azure-devops-github-pr-TOKEN
* azure-devops-github-EMAIL
* azure-devops-github-USERNAME
* TENANTID
* DEV-SUBSCRIPTION-ID
* UAT-SUBSCRIPTION-ID
* PROD-SUBSCRIPTION-ID
* le-private-key-json
* le-regr-json

## Github bot

Use your github bot to generate the token to interact with your repo.

And don't forgot to associate to your repo as ADMIN, without this is impossibile to use the pipelines

## Change values in this files

Change the values in this files

### azure-devops/.env/prod-backend.ini

Put the name of your production subscription

### azure-devops/.env/terraform.tfvars

Change the project prefix and the names of your subscriptions

### azure-devops/.env/(app | iac)_state.tfvars

Change the information about the state, changed the `prefix` with the prefix of your project used into the infra project.
(e.g. selc or dvopla)

## terraform.sh

To be able to launch terraform scripts you can use the script called `terraform.sh`

To launch the app pipelines use

```sh
sh terraform.sh apply app
```

To launch the iac pipelines use

```sh
sh terraform.sh apply iac
```

## Precommit check

Check your code before commit.

<https://github.com/antonbabenko/pre-commit-terraform#how-to-install>

```sh
pre-commit run -a
```

## Externally published paths (do not remove from the sync exclusion)

The NPG SDK is published out of band into the `$web` container by the sync pipeline
(`.devops/pagopa-npg-sdk-sync-deploy-pipelines.yml`), not committed under `assets/`:

| Path        | Published by                   | Contents                                               |
|-------------|--------------------------------|--------------------------------------------------------|
| `npg-uat/`  | NPG SDK sync pipeline (hourly) | `hfsdk.js`, `hfsdk.integrity.json` from NPG staging    |
| `npg-prod/` | NPG SDK sync pipeline (hourly) | `hfsdk.js`, `hfsdk.integrity.json` from NPG production |

The deploy pipeline's `az storage blob sync` has delete-destination on by default, so any blob not
under `assets/` is removed. `--exclude-path` on the sync step keeps these folders: dropping them wipes
the SDK on every commit to `main` and breaks SRI loading in the payment frontends (fail-closed: no
hash, no SDK). Add any future out-of-band asset to the same exclusion.

Here is a reference table about who uses resources and theirs paths from this CDN

| Service                              | Database/collection/field      | Paths             | github repo search link                                                                                                                              |
|--------------------------------------|--------------------------------|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Transactions-service                 |                                | apm               | https://github.com/search?q=repo%3Apagopa%2Fpagopa-ecommerce-transactions-service+https%3A%2F%2Fassets.cdn.platform.pagopa.it%2Fapm&type=code        |
| Transactions-service                 |                                | creditcard        | https://github.com/search?q=repo%3Apagopa%2Fpagopa-ecommerce-transactions-service+https%3A%2F%2Fassets.cdn.platform.pagopa.it%2Fcreditcard&type=code |
|                                      | eCommerce/paymentMethods/asset | apm               | N/A                                                                                                                                                  |
|                                      | eCommerce/paymentMethods/asset | creditcard        | N/A                                                                                                                                                  |
| checkout-fe, wallet-fe, ecommerce-fe |                                | npg-uat, npg-prod | NPG SDK loaded with SRI, published by the sync pipeline (see above), not committed here                                                              |