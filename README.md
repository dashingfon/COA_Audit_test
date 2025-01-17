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
$ forge test --skip "v1-migrator/node_modules/*"

[⠰] Compiling...
[⠔] Compiling 215 files with Solc 0.8.20
[⠒] Solc 0.8.20 finished in 8.05s
Compiler run successful!
Analysing contracts...
Running tests...

Ran 4 tests for test/Migrator.t.sol:MigratorTest
[PASS] test_MigrateAllAsset() (gas: 839971)
[PASS] test_MigrateAllAsset_different_token_owners() (gas: 1123267)
[PASS] test_MigrateAllAsset_token_transfer() (gas: 1042731)
[PASS] test_MigrateERC20() (gas: 265103)
Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 95.04ms (10.67ms CPU time)

Ran 24 tests for test/ASSET.t.sol:ASSET_Test
[PASS] testACREV2_SettingParams() (gas: 116836)
[PASS] testACREV2_TransferFrom() (gas: 397805)
[PASS] testACREV2_TransferFromfail() (gas: 240840)
[PASS] testACREV2_mint() (gas: 359402)
[PASS] testACRE_SettingParams() (gas: 103781)
[PASS] testACRE_TransferFrom() (gas: 299160)
[PASS] testACRE_TransferFromfail() (gas: 142135)
[PASS] testACRE_mint() (gas: 260713)
[PASS] testPLOTV2_SettingParams() (gas: 116457)
[PASS] testPLOTV2_TransferFrom() (gas: 397828)
[PASS] testPLOTV2_TransferFromfail() (gas: 240860)
[PASS] testPLOTV2_mint() (gas: 359359)
[PASS] testPLOT_SettingParams() (gas: 103800)
[PASS] testPLOT_TransferFrom() (gas: 299139)
[PASS] testPLOT_TransferFromfail() (gas: 142157)
[PASS] testPLOT_mint() (gas: 260779)
[PASS] testYARDV2_SettingParams() (gas: 116415)
[PASS] testYARDV2_TransferFrom() (gas: 397784)
[PASS] testYARDV2_TransferFromfail() (gas: 240817)
[PASS] testYARDV2_mint() (gas: 359425)
[PASS] testYARD_SettingParams() (gas: 103757)
[PASS] testYARD_TransferFrom() (gas: 299116)
[PASS] testYARD_TransferFromfail() (gas: 142200)
[PASS] testYARD_mint() (gas: 260667)
Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 94.62ms (27.65ms CPU time)

Ran 2 test suites in 99.72ms (189.66ms CPU time): 28 tests passed, 0 failed, 0 skipped (28 total tests)
```

<!-- display the test coverage -->

``` bash
$ forge coverage -skip "v1-migrator/node_modules/*"

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


