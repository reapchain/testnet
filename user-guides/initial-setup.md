# Initial Setup

## Binary File

In order for you to interact with the ReapChain test network, you will need to have an executable binary file. Currently, this file can be downloaded here:

{% embed url="https://github.com/reapchain/testnets/tree/main/mercury_2022-3" %}
executable binary: reapchain\_\_Linux\_x86\_64.tar.gz, reapchain\_\_Darwin\_amd64.tar.gz
{% endembed %}

Once downloaded, check the integrity of the binary file:

```
md5sum reapchain_Linux_x86_64.tar.gz
md5sum reapchain_Darwin_amd64.tar.gz
```

Your output must match the one shown below:

```
ee25738bd9a10fadb62bb0e77c65887d reapchain_Linux_x86_64.tar.gz
27408a583eb7a268a504d23e81058bdf  reapchain_Darwin_amd64.tar.gz
```

If you want to compile your own binary package, please visit the Developers Guide section.

You can uncompress the binary file with this command:

```
tar -xvf reapchain_Linux_x86_64.tar.gz
tar -xvf reapchain_Darwin_amd64.tar.gz.tar.gz
```

Once downloaded and uncompressed, please execute the following command to make the binary file executable

```
chmod +x reapchaind
```
