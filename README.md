This is my submission for Mobi assesment

# Deliverables

> ## Audit Report

find attached the audit report at this location

> ## Automated Tests and Analysis

1. Slither

Slither is a static analysis tool designed for smart contracts written in Solidity.

To run the tests, slither and foundry have to be installed.

```bash
slither . 
```

[Slither Report](./reports/slither_report.md)

2. 4naly3er

4naly3er is a tool used for analyzing Ethereum smart contracts, particularly during security audits.

The test depends on yarn

```bash
$ yarn

$ yarn add ts-node

$ yarn analyze v1-migrator scope.txt

yarn run v1.22.22
$ ts-node 4naly3er/index.ts v1-migrator scope.txt
Scope:  [
  'contracts/Migrator.sol',
  'contracts/COA-Contracts/Busd.sol',
  'contracts/COA-Contracts/Prlz.sol',
  'contracts/COA-Contracts/land-nfts/ACRE.sol',
  'contracts/COA-Contracts/land-nfts/ERC721A.sol',
  'contracts/COA-Contracts/land-nfts/PLOT.sol',
  'contracts/COA-Contracts/land-nfts/YARD.sol',
  'contracts/COA-Contracts/land-nfts-v2/ACRE.sol',
  'contracts/COA-Contracts/land-nfts-v2/ERC721A.sol',
  'contracts/COA-Contracts/land-nfts-v2/PLOT.sol',
  'contracts/COA-Contracts/land-nfts-v2/YARD.sol'
]
Done in 24.06s.

```

[4naly3er Report](./reports/4naly3er_report.md)

> ## Tests

The Tests are written in foundry

<!-- explain the unit tests -->

1. requirements
foundry

```bash
$ forge test

bangs
```

<!-- display the test coverage -->

``` bash
$ forge coverage

```

[Coverage Report](./reports/coverage_report.md)

> ## Risk Assesment

### Business Logic

* Risks

* Mitigation

### Deployment

* Risks

* Mitigation

> ## Screen Recording


