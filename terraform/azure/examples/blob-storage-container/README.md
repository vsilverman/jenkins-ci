# Deploying a blob storage container to Azure cloud with Terraform

## Problem Statement

Create a blob storage container using Terraform. Write a simple Terraform script, which will solve the following tasks:

1. Creates a Blob Storage Container for any environment (dev, test, live)
2. Ensure the storage container is private, low-cost, and can store things indefinitely
3. While the requirement is that files are stored indefinitely, that isn’t necessary for dev or test environments. Suggest modifications to the storage containers that would ensure the dev or test environment storage containers can remain small and files over 14 days old can be automatically cleaned out.

Note: The files should be stored indefinitely but high availability or redundancy aren’t necessarily important. Cost is the most important piece. The name of each container should reflect the environment name, and the contents of the bucket should be private. The bucket does not need to be replicated across resource groups.

## Solution

Solution to the posted DevOps problem is provided in the form of simple terraform scripts. Those scripts are placed in the subfolders of the current directory.
At the end of these notes different approaches for solving listed tasks are described.

### Task #1

Creating Azure Blob Storage Container with terraform involves resolving several subtasks:

- 1.1 Choose terraform provider for Azure
This subtask may be simply resolved by pointing browser at <https://registry.terraform.io/namespaces/hashicorp> and clicking on Azure image. Resulting page will point to the name of Azure provider - "azurerm"
- 1.2 Install and configure the chozen azure provider
This subtask may be resolved by pointing browser at <https://registry.terraform.io/providers/hashicorp/azurerm/latest> and clicking on "Use Provider" button - it will show the part of correct terraform script.
- 1.3 Create required resources, related to specified azure provider.
This subtask involves several more subtasks, corresponding to separate parts of terraform code:
-- Creating resource groups
-- Creating storage account, referenced by above resource group
-- Creating blob container in above storage account
    Example solution is at <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container>
- 1.4 Create all required resources for several environments
The best practice for resolving this subtask is to create separate set of terraform configurations.
Each configuration should be related to a separate environment. Such approach allows to completely isolate any potential issues in one environment from the others.

### Task #2

Below are several remarks about solution for this task:

- 2.1 Privacy of container is configured by an optional container_access_type argument. The value of this argument is "private" by default. It is not omitted from solution to explicitely emphasize fullfilment of requirements.
- 2.2 Cost of the storage may be low if replication of data is not required. This requirement is configured by
account_replication_type argument. Locally redundant storage (LRS) of this argument will not replicate data across multiple resource groups.
- 2.3 Storage management policy, associated with storage account, allow indefinite duration of storage, as shown in
<https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_management_policy>

### Task #3

To solve this task it would be enough to modify terraform configurations under dev and test folders, which match
corresponding environments. Such modifications may involve addition to terraform scripts in both dev and test folders
a storage management policy resource with properly configured rule. This rule will specify automatic deletion of files more than 14 days old. Example solution may be seen at
<https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_management_policy>
In case of keeping only required stuff, the addition to terraform configurations under dev and test folders may look like below:

```text
resource "azurerm_storage_management_policy" "example" {
  storage_account_id = azurerm_storage_account.example.id

  rule {
    name    = "rule1"
    enabled = true
    filters {
      blob_types   = ["blockBlob"]
    }
    actions {
      version {
        delete_after_days_since_creation = 14
      }
    }
  }
}
```

After making such additions to terraform configurations DevOps engineer will need to run again under required envirionment
`terraform plan`, and in case of satisfied result follow by `terraform apply`. Occasional execution of `terraform destroy`
after provided modifications may be useful for keeping the costs low.

Described above approach for solving defined tasks may be considered as "traditional" one. Such approach is the most time consuming, but it may be useful for thoughtful DevOps engineers, trying to understand what they will need to do in case
requirements, content of the tasks or specific values will be changed.

Probably less time-consuming is another "classic" approach, involving direct searching of proper configurations in a public
repositories, containing related scripts, like e.g. GitHub.
And finally there is another very "modern" aproach for finding solutions to defined tasks. It is probably the fastest one and involves posting direct questions to ChatGPT.
