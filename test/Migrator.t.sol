// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

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

contract MigratorTest is Test {

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

    function test_MigrateERC20() external {
        // prepare

        uint256 amount = 100 ether;
        uint256 price = 1;

        migrator.setTokenInfo(address(busd), address(prlz), price);
        busd.mint(bob, amount);
        prlz.mint(address(migrator), amount);

        uint256 token1BalanceBefore = busd.balanceOf(bob);
        uint256 token2BalanceBefore = prlz.balanceOf(bob);

        // execute

        vm.startPrank(bob);
        busd.approve(address(migrator), amount);
        migrator.migrateERC20Token(amount, address(busd), address(prlz));
        vm.stopPrank();

        // check

        uint256 token1BalanceAfter = busd.balanceOf(bob);
        uint256 token2BalanceAfter = prlz.balanceOf(bob);

        console.log("token1BalanceBefore", token1BalanceBefore);
        console.log("token2BalanceBefore", token2BalanceBefore);
        console.log("token1BalanceAfter", token1BalanceAfter);
        console.log("token2BalanceAfter", token2BalanceAfter);

        assert(token1BalanceBefore - (amount * price) == token1BalanceAfter);
        assert(token2BalanceBefore + (amount * price) == token2BalanceAfter);
    }

    function test_MigrateAllAsset_no_migrator_tokens() external {
        // prepare

        uint256 quantity = 10;
        uint256 price = 1;
        uint256 amount = 100 ether;
        uint256 mint_quantity = 1;

        busd.mint(bob, amount);
        _acre.setCurrentBatch(quantity, price, true);
        _acreV2.setCurrentBatch(quantity, price, true);

        vm.startPrank(bob);
        busd.approve(address(_acre), amount);
        _acre.mint(mint_quantity);
        _acre.setApprovalForAll(address(migrator), true);
        vm.stopPrank();

        vm.startPrank(eve);
        busd.mint(eve, amount);
        busd.approve(address(_acreV2), amount);
        _acreV2.mint(2);
        vm.stopPrank();

        _acreV2.setFreeParticipant(address(migrator), true);
        migrator.setERC721Requirements(address(_acre), address(_yard), address(_plot), address(_acreV2), address(_yardV2), address(_plotV2));

        uint256[] memory acresId = new uint256[](1);
        acresId[0] = 0;
        uint256[] memory otherId = new uint256[](0);

        uint256 bob_acre_balance_before = _acre.balanceOf(bob);
        uint256 bob_acreV2_balance_before = _acreV2.balanceOf(bob);

        // execute

        vm.prank(bob);
        migrator.migrateAllAsset(acresId, otherId, otherId);

        // check

        uint256 balance_acre_after = _acre.balanceOf(bob);
        uint256 balance_acreV2_after = _acreV2.balanceOf(bob);

        console.log("bob acre balance before", bob_acre_balance_before);
        console.log("bob acreV2 balance before", bob_acreV2_balance_before);
        console.log("bob acre balance after", balance_acre_after);
        console.log("bob acreV2 balance after", balance_acreV2_after);

        // assert(balance_acre_after == bob_acre_balance_before - mint_quantity);
        // assert(balance_acreV2_after == bob_acreV2_balance_before);
    }

    function test_MigrateAllAsset() external {
        // prepare

        uint256 quantity = 10;
        uint256 price = 1;
        uint256 amount = 100 ether;
        uint256 mint_quantity = 1;

        busd.mint(bob, amount);
        _acre.setCurrentBatch(quantity, price, true);

        vm.startPrank(bob);
        busd.approve(address(_acre), amount);
        _acre.mint(1);
        _acre.setApprovalForAll(address(migrator), true);
        vm.stopPrank();

        _acreV2.setCurrentBatch(quantity, price, true);
        _acreV2.setFreeParticipant(address(migrator), true);
        migrator.setERC721Requirements(address(_acre), address(_yard), address(_plot), address(_acreV2), address(_yardV2), address(_plotV2));

        uint256[] memory acresId = new uint256[](1);
        acresId[0] = 0;

        uint256[] memory otherId = new uint256[](0);

        uint256 bob_acre_balance_before = _acre.balanceOf(bob);
        uint256 bob_acreV2_balance_before = _acreV2.balanceOf(bob);

        // execute

        vm.prank(bob);
        migrator.migrateAllAsset(acresId, otherId, otherId);

        // check

        uint256 balance_acre_after = _acre.balanceOf(bob);
        uint256 balance_acreV2_after = _acreV2.balanceOf(bob);

        console.log("bob acre balance before", bob_acre_balance_before);
        console.log("bob acreV2 balance before", bob_acreV2_balance_before);
        console.log("bob acre balance after", balance_acre_after);
        console.log("bob acreV2 balance after", balance_acreV2_after);

        assert(balance_acre_after == bob_acre_balance_before - mint_quantity);       assert(balance_acreV2_after == bob_acreV2_balance_before + mint_quantity);
    }

    function testSettingParams() external {

    }

}