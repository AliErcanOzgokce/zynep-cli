#!/bin/bash

cat header/header.txt

# Getting mnemonic
echo "Add your mnemonic: "
read -p "#? " mnemonic
echo ""
sed "s/_mnemonic/$mnemonic/g" conf/truffle-config.js > conf/truffle-config1.js

# Getting httpProvider
echo "Add your Project Id: (Leave it blank if BEP-20) "
read -p "#? " httpProvider
echo ""
sed "s/_httpProvider/$httpProvider/g" conf/truffle-config1.js > truffle/truffle-config.js
cd conf
rm truffle-config1.js
cd ..

# Getting initialSuply
echo "Add your Initial Suply: "
read -p "#? " initialSuply
echo ""
sed "s/_initialAmount/$initialSuply/g" contracts/erc20.sol > contracts/1erc20.sol

# Getting decimals
echo "Add your Decimals: "
read -p "#? " decimals
echo ""
sed "s/_decimalUnits/$decimals/g" contracts/1erc20.sol > contracts/2erc20.sol

# Getting tokenName
echo "Add your Token Name: "
read -p "#? " tokenName
echo ""
sed "s/_tokenName/$tokenName/g" contracts/2erc20.sol > contracts/3erc20.sol


# Getting tokenSymbol
echo "Add your Token Symbol: "
read -p "#? " tokenSymbol
echo ""
sed "s/_tokenSymbol/$tokenSymbol/g" contracts/3erc20.sol > truffle/contracts/Standard_Token.sol
cd contracts
rm 1erc20.sol 2erc20.sol 3erc20.sol
cd ..

# Getting networkName
PS3="Enter network id: "
select i in erc20 bep20 pos20 rinkeby
do
  cd truffle && truffle deploy --network $i
  break
done
