// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Migrator} from "../v1-migrator/contracts/Migrator.sol";

import {ATLACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol";
import {ATLPLOT} from "../v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol";
import {ATLYARD} from "../v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol";

import {ACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol";
import {PLOT} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol";
import {YARD} from "../v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol";

import {BUSD} from "../v1-migrator/contracts/COA-Contracts/Busd.sol";
import {PRLZ} from "../v1-migrator/contracts/COA-Contracts/Prlz.sol";

contract MigratorTest is Test {

    Migrator migrator;
    address signer;
    address bob;
    MockERC20 paymentV1;
    MockERC20 paymentV2;

    ATLACRE _acre;
    ATLYARD _yard;
    ATLPLOT _plot;

    ACRE _acreV2;
    YARD _yardV2;
    PLOT _plotV2;

    function setUp() external {
        signer = makeAddr("signer");
        bob = makeAddr("bob");
        paymentV1 = new MockERC20("MockTokenV1", "MKT1");
        paymentV2 = new MockERC20("MockTokenV2", "MKT2");

        paymentV1.transfer(bob, 100 ether);
        paymentV2.transfer(address(migrator), 100 ether);

        _acre = new ATLACRE(address(paymentV1));
        _acre.setCurrentBatch(10, 1, true);

        _yard = new ATLYARD(address(paymentV1));
        
        _plot = new ATLPLOT(address(paymentV1));

        _acreV2 = new ACRE();
        _acreV2.initialize(address(paymentV1));

        _yardV2 = new YARD();
        _yardV2.initialize(address(paymentV1));

        _plotV2 = new PLOT();
        _plotV2.initialize(address(paymentV1));


        migrator = new Migrator();
        migrator.initialize();
        migrator.grantRole(keccak256("SIGNER_ROLE"), address(this));
        migrator.setERC721Requirements(address(_acre), address(_yard), address(_plot), address(_acreV2), address(_yardV2), address(_plotV2));
        migrator.setTokenInfo(address(paymentV1), address(paymentV2), 1);
    }

    function test_MigrateERC20() external {
        // prepare

        // execute

        // check

        // check token 1 and token 2 balance
        uint256 token1BalanceBefore = paymentV1.balanceOf(bob);
        uint256 token2BalanceBefore = paymentV2.balanceOf(bob);

        uint256 amount = 100 ether;

        assert(token1BalanceBefore == amount);
        assert(token2BalanceBefore == 0);

        vm.startPrank(bob);
        paymentV1.approve(address(migrator), amount);
        migrator.migrateERC20Token(amount, address(paymentV1), address(paymentV2));
        vm.stopPrank();

        // confirm the correct token 1 and 2 balance

        uint256 token1BalanceAfter = paymentV1.balanceOf(bob);
        uint256 token2BalanceAfter = paymentV2.balanceOf(bob);

        assert(token1BalanceAfter == 0);
        assert(token2BalanceAfter == amount);
    }

    function test_MigrateAllAsset_fail() external {
        // prepare

        // execute

        // check
        vm.prank(bob);
        uint256 quantity = 1;
        _acre.mint(quantity);

        assert(_acre.balanceOf(bob) == quantity);
        assert(_acreV2.balanceOf(bob) == 0);

        uint256[] memory acresId = new uint256[](1);
        acresId[0] = 0;
        uint256[] memory otherIds = new uint256[](0);

        vm.prank(bob);
        migrator.migrateAllAsset(acresId, otherIds, otherIds);

        assert(_acre.balanceOf(bob) == 0);
        assert(_acreV2.balanceOf(bob) == 0);
    }

    function test_MigrateAllAsset() external {
        // prepare

        // execute

        // check
        uint256 quantity = 1;
        _acreV2.mint(quantity);

        vm.prank(bob);
        _acre.mint(quantity);

        assert(_acre.balanceOf(bob) == quantity);
        assert(_acreV2.balanceOf(bob) == 0);

        uint256[] memory acresId = new uint256[](1);
        acresId[0] = 0;
        uint256[] memory otherIds = new uint256[](0);

        vm.prank(bob);
        migrator.migrateAllAsset(acresId, otherIds, otherIds);

        assert(_acre.balanceOf(bob) == 0);
        assert(_acreV2.balanceOf(bob) == quantity);
    }

}