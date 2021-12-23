# Account

## Creating an Account

With the reapchaind binary file, you will now be able to create an account and also save your public and private keys for further use.

To create an account with its keys you need to execute:

```
./reapchaind keys add $ACCOUNT_NAME --home $DIRECTORY
```

Replace $ACCOUNT\_NAME with a preferred name for your account. Also, replace $DIRECTORY with a directory you wish to store your account information.

One executed, you will receive this message:

```
- name: $ACCOUNT_NAME
  type: local
  address: reap1rdwpue39cxt7meyp4t8v3ufs86sqx0hj95j6c5
  pubkey: reappub1akkm73fpqdlfgwe267jzl3afgs87gdltfyvsd3evfmkycuegdmv7sxvc3457y9u8muw
  mnemonic: ""
  threshold: 0
  pubkeys: []


**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.

agree join dose begin trouble cotton broken swim theme describe loop crumble medal engage address question baby purse name trust hurt provide soldier gossip
```

Save this output in a secure location since it contains your mnemonic phrase which allows you to recover your account.
