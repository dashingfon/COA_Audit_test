// SPDX-License-Identifier: MIT

// import {ATLACRE} from "../v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {Migrator} from "../v1-migrator/contracts/Migrator.sol";

import {ERC721A} from "../v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol";
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
        // prepare
        busd.mint(bob, 100 ether);
        _acre.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_acre), 10 ether);

        // execute
        vm.prank(bob);
        _acre.mint(1);

        // validate
        assert(_acre.balanceOf(bob) == 1);
        assert(_acre.ownerOf(0) == bob);
    }

    function testACRE_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _acre.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _acre.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testACRE_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _acre.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_acre), 10 ether);
        _acre.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _acre.transferFrom(bob, eve, 0);

        // validate
        assert(_acre.balanceOf(eve) == 1);
        assert(_acre.ownerOf(0) == eve);
    }

    function testACRE_SettingParams() external {
        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _acre.setCurrentBatchActive(active_set);
        _acre.setTxFee(tx_fee);
        _acre.setPaymentToken(payment_token);
        _acre.setFeeCollector(fee_collector);
        _acre.setFreeParticipantController(free_participant_controller, true);
        _acre.setFreeParticipant(free_participant, true);

        // check
        (,, bool active) = _acre._currentBatch();

        // validate
        assert(active == active_set);
        assert(_acre._paymentToken() == payment_token);
        assert(_acre._feeCollector() == fee_collector);
        assert(_acre.freeParticipantControllers(free_participant_controller) == true);
        assert(_acre.freeParticipant(free_participant) == true);
    }

    function testACREV2_mint() external {
        // prepare
        busd.mint(bob, 100 ether);
        _acreV2.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_acreV2), 10 ether);

        // execute
        vm.prank(bob);
        _acreV2.mint(1);

        // validate
        assert(_acreV2.balanceOf(bob) == 1);
        assert(_acreV2.ownerOf(0) == bob);
    }

    function testACREV2_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _acreV2.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _acreV2.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testACREV2_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _acreV2.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_acreV2), 10 ether);
        _acreV2.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _acreV2.transferFrom(bob, eve, 0);

        // validate
        assert(_acreV2.balanceOf(eve) == 1);
        assert(_acreV2.ownerOf(0) == eve);
    }

    function testACREV2_SettingParams() external {
        // prepare
        _acreV2.grantRole(keccak256("SIGNER_ROLE"), address(this));

        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _acre.setCurrentBatchActive(active_set);
        _acre.setTxFee(tx_fee);
        _acre.setPaymentToken(payment_token);
        _acre.setFeeCollector(fee_collector);
        _acre.setFreeParticipantController(free_participant_controller, true);
        _acre.setFreeParticipant(free_participant, true);

        // check
        (,, bool active) = _acre._currentBatch();

        // validate
        assert(active == active_set);
        assert(_acre._paymentToken() == payment_token);
        assert(_acre._feeCollector() == fee_collector);
        assert(_acre.freeParticipantControllers(free_participant_controller) == true);
        assert(_acre.freeParticipant(free_participant) == true);
    }

    function testPLOT_mint() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plot.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_plot), 10 ether);

        // execute
        vm.prank(bob);
        _plot.mint(1);

        // validate
        assert(_plot.balanceOf(bob) == 1);
        assert(_plot.ownerOf(0) == bob);
    }

    function testPLOT_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plot.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _plot.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testPLOT_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plot.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_plot), 10 ether);
        _plot.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _plot.transferFrom(bob, eve, 0);

        // validate
        assert(_plot.balanceOf(eve) == 1);
        assert(_plot.ownerOf(0) == eve);
    }

    function testPLOT_SettingParams() external {
        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _plot.setCurrentBatchActive(active_set);
        _plot.setTxFee(tx_fee);
        _plot.setPaymentToken(payment_token);
        _plot.setFeeCollector(fee_collector);
        _plot.setFreeParticipantController(free_participant_controller, true);
        _plot.setFreeParticipant(free_participant, true);

        // check
        (,, bool active) = _plot._currentBatch();

        // validate
        assert(active == active_set);
        assert(_plot._paymentToken() == payment_token);
        assert(_plot._feeCollector() == fee_collector);
        assert(_plot.freeParticipantControllers(free_participant_controller) == true);
        assert(_plot.freeParticipant(free_participant) == true);
    }

    function testPLOTV2_mint() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plotV2.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_plotV2), 10 ether);

        // execute
        vm.prank(bob);
        _plotV2.mint(1);

        // validate
        assert(_plotV2.balanceOf(bob) == 1);
        assert(_plotV2.ownerOf(0) == bob);
    }

    function testPLOTV2_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plotV2.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _plotV2.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testPLOTV2_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _plotV2.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_plotV2), 10 ether);
        _plotV2.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _plotV2.transferFrom(bob, eve, 0);

        // validate
        assert(_plotV2.balanceOf(eve) == 1);
        assert(_plotV2.ownerOf(0) == eve);
    }

    function testPLOTV2_SettingParams() external {
        // prepare
        _plotV2.grantRole(keccak256("SIGNER_ROLE"), address(this));

        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _plotV2.setCurrentBatchActive(active_set);
        _plotV2.setTxFee(tx_fee);
        _plotV2.setPaymentToken(payment_token);
        _plotV2.setFeeCollector(fee_collector);
        _plotV2.setFreeParticipantController(free_participant_controller, true);
        _plotV2.setFreeParticipant(free_participant, true);

        // check
        (,,bool active,,) = _plotV2._currentBatch();

        // validate
        assert(active == active_set);
        assert(_plotV2._paymentToken() == payment_token);
        assert(_plotV2._feeCollector() == fee_collector);
        assert(_plotV2.freeParticipantControllers(free_participant_controller) == true);
        assert(_plotV2.freeParticipant(free_participant) == true);
    }
 
    function testYARD_mint() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yard.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_yard), 10 ether);

        // execute
        vm.prank(bob);
        _yard.mint(1);

        // validate
        assert(_yard.balanceOf(bob) == 1);
        assert(_yard.ownerOf(0) == bob);
    }

    function testYARD_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yard.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _yard.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testYARD_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yard.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_yard), 10 ether);
        _yard.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _yard.transferFrom(bob, eve, 0);

        // validate
        assert(_yard.balanceOf(eve) == 1);
        assert(_yard.ownerOf(0) == eve);
    }

    function testYARD_SettingParams() external {
        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _yard.setCurrentBatchActive(active_set);
        _yard.setTxFee(tx_fee);
        _yard.setPaymentToken(payment_token);
        _yard.setFeeCollector(fee_collector);
        _yard.setFreeParticipantController(free_participant_controller, true);
        _yard.setFreeParticipant(free_participant, true);

        // check
        (,, bool active) = _yard._currentBatch();

        // validate
        assert(active == active_set);
        assert(_yard._paymentToken() == payment_token);
        assert(_yard._feeCollector() == fee_collector);
        assert(_yard.freeParticipantControllers(free_participant_controller) == true);
        assert(_yard.freeParticipant(free_participant) == true);
    }

    function testYARDV2_mint() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yardV2.setCurrentBatch(1, 1, true);
        vm.prank(bob);
        busd.approve(address(_yardV2), 10 ether);

        // execute
        vm.prank(bob);
        _yardV2.mint(1);

        // validate
        assert(_yardV2.balanceOf(bob) == 1);
        assert(_yardV2.ownerOf(0) == bob);
    }

    function testYARDV2_TransferFromfail() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yardV2.setCurrentBatch(1, 1, true);

        // execute and check
        vm.startPrank(bob);
        vm.expectRevert();
        _yardV2.transferFrom(bob, eve, 0);
        vm.stopPrank();
    }

    function testYARDV2_TransferFrom() external {
        // prepare
        busd.mint(bob, 100 ether);
        _yardV2.setCurrentBatch(1, 1, true);
        vm.startPrank(bob);
        busd.approve(address(_yardV2), 10 ether);
        _yardV2.mint(1);
        vm.stopPrank();

        // execute
        vm.prank(bob);
        _yardV2.transferFrom(bob, eve, 0);

        // validate
        assert(_yardV2.balanceOf(eve) == 1);
        assert(_yardV2.ownerOf(0) == eve);
    }

    function testYARDV2_SettingParams() external {
        // prepare
        _yardV2.grantRole(keccak256("SIGNER_ROLE"), address(this));

        // execute
        bool active_set = false;
        uint256 tx_fee = 10;
        address payment_token = address(busd);
        address fee_collector = address(this);
        address free_participant_controller = address(this);
        address free_participant = address(this);

        _yardV2.setCurrentBatchActive(active_set);
        _yardV2.setTxFee(tx_fee);
        _yardV2.setPaymentToken(payment_token);
        _yardV2.setFeeCollector(fee_collector);
        _yardV2.setFreeParticipantController(free_participant_controller, true);
        _yardV2.setFreeParticipant(free_participant, true);

        // check
        (,,bool active,,) = _yardV2._currentBatch();

        // validate
        assert(active == active_set);
        assert(_yardV2._paymentToken() == payment_token);
        assert(_yardV2._feeCollector() == fee_collector);
        assert(_yardV2.freeParticipantControllers(free_participant_controller) == true);
        assert(_yardV2.freeParticipant(free_participant) == true);
    }
 
}