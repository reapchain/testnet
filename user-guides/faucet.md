# Faucet

Once you've set up your account information, you can now receive some coins from the Faucet.&#x20;

There are two ways you can do this

### Web Interface

1. Visit [http://faucet.reapchain.com/](http://faucet.reapchain.com)&#x20;
2. You can choose to enter your address manually or connect with Keplr, if you would like to use Keplr please skip to [here](#keplr)

.
3. Verify that you are not a robot
4. Click "Send Coins" which will transfer 10reap to your account

![Imgur](https://i.imgur.com/GDx53y9.png)

### Keplr
1. Click "Connect with Keplr"
2. A pop-up to add the TestNet Chain to Keplr will open

![Imgur](https://i.imgur.com/aWyLM3y.png)

3. If you approve of this, a pop-up to access the chain will open

![Imgur](https://i.imgur.com/S02XsM7.png)

4. If you approve this pop-up, your address will be automatically entered.
5. Verify that you are not a robot
6. Click "Send Coins" which will transfer 10reap to your account

### Coin Values

REAP is the network’s native cryptocurrency. The smallest unit of REAP is the uREAP or the micro REAP, where 1 reap = 1,000,000 ureap.

### Command Line Interface

Use a curl command to post a request like this:

```
curl -X POST -d '{"address": "reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5"}' http://faucet.reapchain.com
```

If successful the return message should look like this:&#x20;

```
{"transfers":[{"coin":"10000000ureap","status":"ok"}]}
```

### Transfer Limits

A single faucet request transfers 10,000,000ureap with a daily total limit of 100,000,000ureap per account.

### Checking Balance

In order to check your balance, you need to execute this command:

```
./mercuryd query bank balances $MY_ADDRESS --node $NODE_IP --chain-id $CHAIN_ID
```

You need to replace these variables:

1. **$MY\_ADDRESS** - Your address for your account
2. **$NODE\_IP** - The IP address for a node in the Mercury TestNet. Currently you can use [http://3.34.158.5:27100/](http://3.34.158.5:27100)
3. **$CHAIN\_ID** - The ID for the blockchain. Currently you can use "mercury"

An example:

```
./mercuryd query bank balances reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5 --node http://3.34.158.5:27100/ --chain-id mercury
```

If successful, the return message should look like this:

```
balances:
- amount: "10000000"
  denom: ureap
pagination:
  next_key: null
  total: "0"
```
