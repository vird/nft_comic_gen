##  Description ##

Решение для хакатона https://hackathon.tezos.org.ua/
 * NFT
 * Движок для комиксов
 * Презентация
 * Смарт контракты + dev env + тесты

## front-end ##
### install ###

    npm i -g iced-coffee-script
    cd front
    npm ci
    npm run front_dev
    # еще вам понадобится temple wallet для взаимодействия

## blockchain back-end (aka smart contracts) ##
### install ###

    cd blockchain_back
    npm ci

### dev usage ###

    # flextesa sandbox
    npm run start-sandbox
    # run test
    npx truffle test
    # rebuild contracts + deploy locally
    npm run iteration
    # deploy contracts to deplhinet using faucet.json
    npm run deploy_prod
