# Faucet

Once you've set up your account information, you can now receive some coins from the Faucet.

There are two ways you can do this.

If you want to use Keplr wallet, your account must be signed in to Keplr.

### Web Interface

1. Visit [https://faucet.reapchain.org](https://faucet.reapchain.org)
2. You can choose to enter your address manually or connect with Keplr, if you would like to use Keplr please skip to [here](faucet.md#keplr)
3. Verify that you are not a robot 4. Click "Send Coins" which will transfer 1 reap to your account

![](https://i.imgur.com/GDx53y9.png)

### Keplr

1. Click "Connect with Keplr"
2. A pop-up to add the TestNet Chain to Keplr will open
3.  If you approve of this, a pop-up to access the chain will open

    <figure><img src="../.gitbook/assets/image (2).png" alt="" width="355"><figcaption></figcaption></figure>
4. If you approve this pop-up, your address will be automatically entered.
5. Verify that you are not a robot
6. Click "Send Coins" which will transfer 1 reap to your account

### Coin Values

REAP is the network’s native cryptocurrency. The smallest unit of REAP is the aREAP or the atto REAP, where 1 reap = 1,000,000,000,000,000,000 areap.

### Command Line Interface

Use a curl command to post a request like this:

```
curl -X POST -d '{"address": "reap17xvpmpsnu8qucu422p3exqt0yw5gmuxwknec0r"}' http://faucet.reapchain.com
```

If successful the return message should look like this:

```
{"transfers":[{"coin":"1000000000000000000areap","status":"ok"}]}
```

### Transfer Limits

A single faucet request transfers 1 reap with a daily total limit of 3 reap per account.

### Checking Balance

In order to check your balance, you need to execute this command:

```
./reapchaind query bank balances $MY_ADDRESS --node $NODE_IP --chain-id $CHAIN_ID
```

You need to replace these variables:

1. **$MY\_ADDRESS** - Your address for your account
2. **$NODE\_IP** - The IP address for a node in the Mercury TestNet. Currently you can use test
3. **$CHAIN\_ID** - The ID for the blockchain. Currently you can use "reapchain\_2023-1"

An example:

```
./reapchaind query bank balances reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5 --node https://test-rpc.reapchain.org:443 --chain-id reapchain_2023-1
```

If successful, the return message should look like this:

```
balances:
- amount: "2000000000000000000"
  denom: areap
pagination:
  next_key: null
  total: "0"
```
