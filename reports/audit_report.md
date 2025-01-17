# Audit Report

I would like to express our gratitude to Mobi Automation for the opportunity to conduct this audit.

## Limitations

The purpose of this audit is to identify potential vulnerabilities, issues, and areas of improvement within the smart contract(s) provided. While every effort has been made to identify security risks and ensure the integrity of the code, a successful audit does not guarantee that the contract is free from vulnerabilities or immune to all attacks.

Smart contracts inherently operate in a complex and evolving ecosystem where new exploits and attack vectors are continually discovered. Additionally, changes made to the contract after the audit may introduce new risks not accounted for in this assessment.

The audit should be considered as one component of a comprehensive security strategy.

## Project Scope

| File                                                                               |  nSloc |
|------------------------------------------------------------------------------------|--------|
| [Migrator](v1-migrator/contracts/Migrator.sol)                                     | 250    |
| [Busd](v1-migrator/contracts/COA-Contracts/Busd.sol)                               | 8      |
| [Prlz](v1-migrator/contracts/COA-Contracts/Prlz.sol)                               | 8      |
| [ACRE](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol)                     | 82     |
| [ERC721A](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol)               | 272    |
| [PLOT](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol)                     | 78     |
| [YARD](1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol)                      | 82     | 
| [ACRE](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol)                  | 149    |
| [ERC721A](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol)            | 325    |
| [PLOT](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol)                  | 149    |
| [YARD](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol)                  | 149    |

## Executive Summary

### Migrator

The Migrator contract facilitates the migration of ERC20 tokens and ERC721 NFTs from one version to another. It includes the following key features:

Initialization and Roles:

The contract is initialized with the initialize function, setting up the default admin role.
A SIGNER_ROLE is defined for authorized operations.
Requirements Structure:

The Requirement struct holds addresses for different asset types (acre, plot, yard) and their new versions, as well as token addresses and a price.
Mappings and State Variables:

_withdrawOldNFT: Validates and withdraws an old NFT.
_mintNewNFT: Mints new NFTs and transfers them to the user.
migrateERC20Token: Migrates ERC20 tokens from one version to another.
migrateAllAsset: Batch migrates multiple asset types (acre, plot, yard).
Utility Functions:

setERC721Requirements: Sets the necessary requirements for ERC721 migrations.
setTokenInfo: Sets the necessary requirements for ERC20 migrations.


### Assets

The ATLACRE, ACRE, ATLPLOT, PLOT, ATLYARD and YARD contracts are ERC721A-compliant NFT contract with ownership control, designed for minting and managing batches of NFTs

## Findings

### High

| Id     |  Title                                                                                                  |
|--------|---------------------------------------------------------------------------------------------------------|
| H-0    |    no access control in token function mint                                                             |
| H-1    |    Attacker can replace user migrated tokens by sending tokens to the migration contract                |

> #### H-0

There is no access control in the `function mint` in the contract Busd.sol and Prlz.sol.
This allows anyone to mint tokens, an attacker can frontrun a user and mint the maximum amount of tokens. permanently DoSing the contract

> #### H-1

The migrator contract is used to transfer tokens from one version to another with the function 

```solidity

function migrateAllAsset(
        uint[] memory _acre,
        uint[] memory _plot,
        uint[] memory _yard
    ) external returns (bool success)

```

the test demonstrating the vulnurability can be run with

```bash
forge test --skip "v1-migrator/node_modules/*" --match-test "test_MigrateAllAsset_token_transfer"
```

### Medium

| Id     |  Title                                                                                                  |
|--------|---------------------------------------------------------------------------------------------------------|
| M-0    |  Tokens can be migrated to a different id                                                               |
| M-1    |  Requirements.price is not constrained                                                                  |
| M-2    |                                                                                                         |K

> #### M-0

the test demonstrating the vulnurability can be run with

```bash
forge test --skip "v1-migrator/node_modules/*" --match-test "test_MigrateAllAsset_different_token_owners"
```
> #### M-1

