import { HardhatUserConfig, task } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import '@openzeppelin/hardhat-upgrades';
let secret = require('./.secret.json');

// Custom task to list accounts
task("accounts", "Prints the list of accounts", async (args, hre) => {
  const accounts = await hre.ethers.getSigners();

  accounts.forEach((account, index) => {
    console.log(`Account ${index}: ${account.address}`);
  });
});

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: '0.8.24',
        settings: {
          optimizer: {
            enabled: true,
          },
        },
      },
      {
        version: '0.8.5',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: '0.8.9',
        settings: {
          optimizer: {
            enabled: true,
          },
        },
      },
    ],
  },

  networks: {
    localhost: {
      url: 'http://127.0.0.1:8545',
    },
    bscTestnet: {
      url: secret.binanceTestnetRPC,
      accounts: [secret.privateKeyTestnet],
    },
    // polygonAmoyTestnet: {
    //   url: secret.polygonAmoyTestnetRPC || "", 
    //   accounts: [secret.privateKeyTestnet],
    // },
    goerli: {
      url: secret.goerliTestnetRPC,
      accounts: [secret.privateKeyTestnet],
    },
    baseTestnet: {
      url: secret.baseSepolinaTestnetRPC,
      accounts: [secret.privateKeyTestnet],
    },
    ethereum: {
      url: secret.ethereumMainnetRPC,
      accounts: [secret.privateKeyMainnet],
    },
    bscMainnet: {
      url: secret.binanceMainnetRPC,
      accounts: [secret.privateKeyMainnet],
    },
    baseMainnet: {
      url: secret.baseMainnetRPC,
      accounts: [secret.privateKeyMainnet],
    },
  },

  etherscan: {
    apiKey: {
      bscTestnet: secret.bscscanAPI,
      bsc: secret.bscscanAPI,
      mainnet: secret.etherscanAPI,
      goerli: secret.etherscanAPI,
      baseSepolia: secret.basescanAPI,
      baseMainnet: secret.basescanAPI,
    },
  },
};

export default config;
