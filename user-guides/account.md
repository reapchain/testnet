# Account

## Creating an Account

With the mercuryd binary file, you will now be able to create an account and also save your public and private keys for further use.

To create an account with its keys you need to execute:

```
./reapchaind keys add $ACCOUNT_NAME --home $DIRECTORY --keyring-backend test
```

Replace $ACCOUNT\_NAME with a preferred name for your account. Also, replace $DIRECTORY with a directory you wish to store your account information.

One executed, you will receive this message:

```

- name: $ACCOUNT_NAME
  type: local
  address: reap1ked7lxalvshf576mzw97l9ccu5ufu6xv703jhv
  pubkey: '{"@type":"/ethermint.crypto.v1.ethsecp256k1.PubKey","key":"A6DzrEUgrG5bdB9edwXWvq1bM2g2S/HTuXuxmOgZTpK3"}'
  mnemonic: ""


**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.

clean inflict imitate census fiscal badge another amateur seek power art menu cradle joke grab high wise endless repeat invest judge prison horse scrub

```

Save this output in a secure location since it contains your mnemonic phrase which allows you to recover your account.
