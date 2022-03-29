# Join Testnet

### Joining a Testnet

You specify the network you want to join by setting the **genesis file** and **seeds**. If you need more information about past networks, check our [testnets repo](https://github.com/reapchain/testnets)

| Testnet Chain ID | Description                    | Site                                                                               | Version | Status |
| ---------------- | ------------------------------ | ---------------------------------------------------------------------------------- | ------- | ------ |
| mercury\_2022-1  | Reapchain Testnet(with EVM)    | [mercury\_2022-1](https://github.com/reapchain/testnets/tree/main/mercury\_2022-1) | v0.2.x  | Live   |
| mercury          | Reapchain Testnet(without EVM) | [mercury](https://github.com/reapchain/testnets/tree/main/mercury)                 | v0.1.x  | Steal  |



If you would like to setup a general node on your local machine to participate and store data for the Blockchain, the you can do so by following these step:

1. Download the genesis.json file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/genesis.json)
2. Download the node\_init.sh file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/node\_init.sh)
3. Download the node\_run.sh file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/node\_run.sh)
4. Download the reapchain\_Linux\_x86\_64.tar.gz file from [here](../mercury\_2022-1/reapchain\_Linux\_x86\_64.tar.gz) then unzip, you cna get reapchaind binary.
5. If you follow all the above steps, you can get all the files needed for joining and verification on the Reapchian Testnet
6. Change the properties of the files.
7. "chmod +x node_init.sh", "chmod +x node_run.sh" , "chmod +x reapchaind."
8. Please execute node_init.sh and node_run.sh, then you will be automatically joined to Reapchain Testnet.
