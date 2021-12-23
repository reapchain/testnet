# Private Repository Access

## GitHub User Token

In order to access a private repository in GitHub, you first need to create a personal access token for your GitHub Account. \
\
Please follow these steps to create one for your own account.

1. Log into your **account**.&#x20;
2. In the upper-right corner of any page, click your profile photo, then click **Settings**.
3. In the left sidebar, click **Developer settings**.
4. In the left sidebar, click **Personal access tokens**.&#x20;
5. Click **Generate new token**.
6. Give your token a descriptive **name**.
7. Select an **expiration** date and also access permission for the token, such as **'repo'**
8. Click **Generate token**.
9. Copy this **token** to clipboard.

## GitConfig

The Global GitConfig file needs to edited in order to access repositories that are listed as private.

| **Scope** | **Location and Filename**                           |
| --------- | --------------------------------------------------- |
|  System   |  \~etc/gitconfig                                    |
|  Global   |  \~home/\<username>/.gitconfig or \~root/.gitconfig |
|  Local    |  \<git-repo>/.git/config                            |
|  Worktree |  \<git-repo>/.git/config.worktree                   |

In the .gitconfig file present in the \~home/\<username>/ directory please add these lines:

```
[url "https://<USERNAME>:<PERSONAL ACCESS TOKEN>@github.com/"]
        insteadOf = "https://github.com/"
[http]
        sslVerify = false
```

## Go Environment

Please check that your GoLang environment has the private module added as well.

You can run this command to add a private repository:

```
go env -w GOPRIVATE=github.com/reapchain
```

Once that is done please execute this command to check your environment:

```
go env
```

The output should have listed the added URL as a private repository

```
GOPRIVATE="github.com/reapchain"
```

