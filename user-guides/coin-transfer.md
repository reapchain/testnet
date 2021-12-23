# Coin Transfer

After receiving some coins from the Faucet, you will now be able to transfer these coins to any other account.&#x20;

The following command is used to interact with the ReapChain TestNet in order to facilitate the transaction.

```
./reapchaind tx bank send $MY_ADDRESS $RECIPIENT_ADDRESS $AMOUNT --node $NODE_IP --chain-id $CHAIN_ID --fees $FEE_AMOUNT --home $DIRECTORY
```

You will need to change the variables in the command:

1. **$MY\_ADDRESS** - Your address for your account
2. **$RECIPIENT\_ADDRESS** - The address you want to transfer some coins to
3. **$AMOUNT** - The amount of coins you want to transfer and also the denomination (200ureap)
4. **$NODE\_IP** - The IP address for a node in the ReapChain TestNet. Currently you can use [http://3.34.158.5:27100/](http://3.34.158.5:27100)
5. **$CHAIN\_ID** - The ID for the blockchain. Currently you can use "mercury"
6. **$FEE\_AMOUNT** - The amount of fees you need to pay in order for a successful transaction. Currently the amount you have to pay is 20000ureap.
7. **$DIRECTORY** - The directory where you stored your keys when you created your account.

An example:

```
./reapchaind tx bank send  reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5 reap1yklx36ud99wulgd5p805pkg34xsrarwqgtpqx6 200ureap --node http://3.34.158.5:27100/ --chain-id mercury--fees 20000ureap --home test_dir
```

If successful the return messages should be:&#x20;

```
{"body":{"messages":[{"@type":"/cosmos.bank.v1beta1.MsgSend","from_address":"reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5","to_address":"reap1yklx36ud99wulgd5p805pkg34xsrarwqgtpqx6","amount":[{"denom":"ureap","amount":"200"}]}],"memo":"","timeout_height":"0","extension_options":[],"non_critical_extension_options":[]},"auth_info":{"signer_infos":[],"fee":{"amount":[{"denom":"ureap","amount":"20000"}],"gas_limit":"200000","payer":"","granter":""}},"signatures":[]}

confirm transaction before signing and broadcasting [y/N]: y
{"height":"12670","txhash":"D2B86E909A3993DA9E26EE48FDE2D4CF55C75EEF83CD649DC5445DAE9725DCBA","codespace":"","code":0,"data":"0A060A0473656E64","raw_log":"[{\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"send\"},{\"key\":\"sender\",\"value\":\"reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5\"},{\"key\":\"module\",\"value\":\"bank\"}]},{\"type\":\"transfer\",\"attributes\":[{\"key\":\"recipient\",\"value\":\"reap1yklx36ud99wulgd5p805pkg34xsrarwqgtpqx6\"},{\"key\":\"sender\",\"value\":\"reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5\"},{\"key\":\"amount\",\"value\":\"200ureap\"}]}]}]","logs":[{"msg_index":0,"log":"","events":[{"type":"message","attributes":[{"key":"action","value":"send"},{"key":"sender","value":"reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5"},{"key":"module","value":"bank"}]},{"type":"transfer","attributes":[{"key":"recipient","value":"reap1yklx36ud99wulgd5p805pkg34xsrarwqgtpqx6"},{"key":"sender","value":"reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5"},{"key":"amount","value":"200ureap"}]}]}],"info":"","gas_wanted":"200000","gas_used":"70261","tx":null,"timestamp":""}
```

### Checking Balance

In order to check your balance, you need to execute this command:

```
./reapchaind query bank balances $MY_ADDRESS --node $NODE_IP --chain-id $CHAIN_ID
```

You need to replace these variables:

1. **$MY\_ADDRESS** - Your address for your account
2. **$NODE\_IP** - The IP address for a node in the ReapChain TestNet. Currently you can use [http://3.34.158.5:27100/](http://3.34.158.5:27100)
3. **$CHAIN\_ID** - The ID for the blockchain. Currently you can use "mercury"

An example:

```
./reapchaind query bank balances reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5 --node http://3.34.158.5:27100/ --chain-id mercury
```

If successful, the return message should look like this:

```
balances:
- amount: "9979800"
  denom: ureap
pagination:
  next_key: null
  total: "0"
```
