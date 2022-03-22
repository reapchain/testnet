# Initial Setup

## Binary File

In order for you to interact with the ReapChain Mercury Test Network, you will need to have an executable binary file. Currently, this file can be downloaded here:

{% embed url="https://github.com/reapchain/testnets/tree/main/mercury_2022-1" %}
executable binary: reapchain\__Linux\_x86\_64.tar.gz t_
{% endembed %}



Once downloaded,  check the integrity of the binary file:

```
md5sum reapchain_Linux_x86_64.tar.gz
```

Your output must match the one shown below:

```
a2cb6468c612ee6a5fa5194c58d28c40  reapchain_Linux_x86_64.tar.gz
```

If you want to compile your own binary package, please visit the Developers Guide section.

Once downloaded and uncompressed, please execute the following command to make the binary file executable

```
chmod +x reapchaind
```
