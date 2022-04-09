require('@nomiclabs/hardhat-waffle')
require('dotenv').config()

module.exports = {
  solidity: '0.8.0',
  networks: {
    ropsten: {
      // import local .env file
      url: process.env.REACT_APP_ALCHEMY_HTTP_KEY,
      accounts: [ process.env.REACT_APP_ROPSTEN_TESTNET_PRIVATE_KEY ]
    }
  }
}
