// SPDX-License-Identifier: MIT

// import {ATLACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {Migrator} from "../v1-migrator/contracts/Migrator.sol";

import {ATLACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol";
import {ATLPLOT} from "../v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol";
import {ATLYARD} from "../v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol";

import {ACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol";
import {PLOT} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol";
import {YARD} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol";

import {BUSD} from "../v1-migrator/contracts/COA-Contracts/Busd.sol";
import {PRLZ} from "../v1-migrator/contracts/COA-Contracts/Prlz.sol";

pragma solidity 0.8.20;

contract ASSET_Test is Test {
    address bob;
    address eve;
    Migrator migrator;

    ATLACRE _acre;
    ATLYARD _yard;
    ATLPLOT _plot;

    ACRE _acreV2;
    YARD _yardV2;
    PLOT _plotV2;

    BUSD busd;
    PRLZ prlz;

    function setUp() external {
        bob = makeAddr("bob");
        eve = makeAddr("eve");
        busd = new BUSD();
        prlz = new PRLZ();

        _acre = new ATLACRE(address(busd));
        _yard = new ATLYARD(address(busd));
        _plot = new ATLPLOT(address(busd));

        _acreV2 = new ACRE();
        _acreV2.initialize(address(busd));
        _acreV2.grantRole(keccak256("SIGNER_ROLE"), address(this));

        _yardV2 = new YARD();
        _yardV2.initialize(address(busd));
        _yardV2.grantRole(keccak256("SIGNER_ROLE"), address(this));

        _plotV2 = new PLOT();
        _plotV2.initialize(address(busd));
        _plotV2.grantRole(keccak256("SIGNER_ROLE"), address(this));


        migrator = new Migrator();
        migrator.initialize();
        migrator.grantRole(keccak256("SIGNER_ROLE"), address(this));
    }

    function testACRE_mint() external {

    }

    function testACRE_TransferFromfail() external {

    }

    function testACRE_TransferFrom() external {

    }

    function testACRE_SettingParams() external {

    }



    // function testACRE_mint() external {

    // }

    // function testACRE_TransferFromfail() external {

    // }

    // function testACRE_TransferFrom() external {

    // }

    // function testACRE_SettingParams() external {

    // }



    // function testACRE_mint() external {

    // }

    // function testACRE_TransferFromfail() external {

    // }

    // function testACRE_TransferFrom() external {

    // }

    // function testACRE_SettingParams() external {

    // }



    // function testACRE_mint() external {

    // }

    // function testACRE_TransferFromfail() external {

    // }

    // function testACRE_TransferFrom() external {

    // }

    // function testACRE_SettingParams() external {

    // }



    // function testACRE_mint() external {

    // }

    // function testACRE_TransferFromfail() external {

    // }

    // function testACRE_TransferFrom() external {

    // }

    // function testACRE_SettingParams() external {

    // }



    // function testACRE_mint() external {

    // }

    // function testACRE_TransferFromfail() external {

    // }

    // function testACRE_TransferFrom() external {

    // }

    // function testACRE_SettingParams() external {

    // }
}