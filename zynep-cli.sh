#!/bin/bash

cat header.txt

function getMnemonic() {
    echo "Add your mnemonic: "
    read -p "#? " mnemonic
    echo ""
}


function getNetwork() {
    NETWORK=0
    echo 'Please choice your blockchain network: '
    options=("ERC-20" "BEP-20" "TRC-20" "POS-20")
    select opt in "${options[@]}"
    do
        case $opt in
            "ERC-20")
                local NETWORK=ERC-20
                ;;
            "BEP-20")
                local NETWORK=BEP-20
                ;;
            "TRC-20")
                local NETWORK=TRC-20
                ;;
            "POS-20")
                local NETWORK=POS-20
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

function getHttpProvider() {
    echo "Add your HTTP provider URL: "
    read -p "#? " httpProvider
    echo ""
}

#function getTokenType() {}

function getInitialSuply() {
    echo "Add your Initial Suply: "
    read -p "#? " initialSuply
    echo ""
}

function getDecimals() {
    echo "Add your Decimals: "
    read -p "#? " decimals
    echo ""
}

function getTokenName() {
    echo "Add your Token Name: "
    read -p "#? " tokenName
    echo ""
}

function getTokenSymbol() {
    echo "Add your Token Symbol: "
    read -p "#? " tokenSymbol
    echo ""
}

getMnemonic
#getNetwork
getHttpProvider
getInitialSuply
getDecimals
getTokenName
getTokenSymbol
