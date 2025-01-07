const hre = require('hardhat');
const { Contract } = require("hardhat/internal/hardhat-network/stack-traces/model");
import {  ATLACRE, ATLPLOT, ATLYARD,  PRLZ , BUSD, Migrator} from "../typechain-types";
import { Signer, AddressLike } from "ethers";
import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { getEthBalance, tokenToWei, weiToToken } from "../functions";
import { Addresses } from "./addresses";
import { ACRE, PLOT, YARD } from "../typechain-types/contracts/coa-contracts/land-nfts-v2";

interface IDeployFixtureResponse {
    deployer: Signer,
    user1: Signer,
    user2: Signer,
    user3: Signer,
    feeCollector: Signer,
    acreATL: ATLACRE;
    plotATL: ATLPLOT;
    yardATL: ATLYARD;
    acreATLV2: ACRE;
    plotATLV2: PLOT;
    yardATLV2: YARD;
    usdt: BUSD;
    prlz: PRLZ;
    migrator: Migrator;
    user1Address: string,
    user2Address: string,
    user3Address: string,
    acreATLAddress: string,
    plotATLAddress: string,
    yardATLAddress: string
    deployerAddress:string
    acreATLV2Address: string,
    plotATLV2Address: string,
    yardATLV2Address: string;
    usdtAddress: string;
    prlzAddress: string;
    migratorAddress: string;
}


export async function deployLocalContractFixture(): Promise<IDeployFixtureResponse> {

    const [deployer, user1, user2, user3, feeCollector] = await hre.ethers.getSigners();
    const USDT = await hre.ethers.getContractFactory('BUSD');
    const usdt = await USDT.deploy();

    const Prlz = await hre.ethers.getContractFactory('PRLZ');
    const prlz = await Prlz.deploy();

    // // DEPLOY GENESIS
    const usdtAddress = await usdt.getAddress();

    const ATLACRE = await hre.ethers.getContractFactory('ATLACRE');
    const ATLPLOT = await hre.ethers.getContractFactory('ATLPLOT');
    const ATLYARD = await hre.ethers.getContractFactory('ATLYARD');
    const acreATL = await ATLACRE.deploy(usdtAddress);
    const plotATL = await ATLPLOT.deploy(usdtAddress);
    const yardATL = await ATLYARD.deploy(usdtAddress);

    // DEPLOY MIGRATOR CONTRACT
    const MIGRATOR = await hre.ethers.getContractFactory('Migrator');
    const migrator = await hre.upgrades.deployProxy(MIGRATOR, []);

    // DEPLOY ATLV2
    const ACRE = await hre.ethers.getContractFactory('ACRE');
    const PLOT = await hre.ethers.getContractFactory('PLOT');
    const YARD = await hre.ethers.getContractFactory('YARD');
    const acreATLV2 = await hre.upgrades.deployProxy(ACRE, [usdtAddress]);
    const plotATLV2 = await hre.upgrades.deployProxy(PLOT, [usdtAddress]);
    const yardATLV2 = await hre.upgrades.deployProxy(YARD, [usdtAddress]);

    const user1Address = await user1.getAddress();
    const user2Address = await user2.getAddress();
    const user3Address = await user3.getAddress();
    const deployerAddress = await deployer.getAddress();
    const acreATLAddress = await acreATL.getAddress();
    const plotATLAddress = await plotATL.getAddress();
    const yardATLAddress = await yardATL.getAddress();
    const acreATLV2Address = await acreATLV2.getAddress();
    const plotATLV2Address = await plotATLV2.getAddress();
    const yardATLV2Address = await yardATLV2.getAddress();
    const prlzAddress = await prlz.getAddress();
    const migratorAddress = await migrator.getAddress();



      // initialize genesis token batchs
      await acreATL.connect(deployer).setCurrentBatch(104, tokenToWei('100'), true);
      await plotATL.connect(deployer).setCurrentBatch(60, tokenToWei('150'), true);
      await yardATL.connect(deployer).setCurrentBatch(2159, tokenToWei('300'), true);

      //mint payment token for users
      await usdt.connect(user1).mint(user1Address, tokenToWei("100000"));
      await usdt.connect(user2).mint(user2Address, tokenToWei("100000"));
      await usdt.connect(user3).mint(user3Address, tokenToWei("100000"));
      await prlz.connect(user1).mint(migratorAddress, tokenToWei("100000"));

    //   //approve token for payment
      await usdt.connect(user1).approve(acreATLAddress, tokenToWei("100000"));
      await usdt.connect(user1).approve(plotATLAddress, tokenToWei("100000"));
      await usdt.connect(user1).approve(yardATLAddress, tokenToWei("100000"));
      await usdt.connect(user2).approve(acreATLAddress, tokenToWei("100000"));
      await usdt.connect(user2).approve(plotATLAddress, tokenToWei("100000"));
      await usdt.connect(user2).approve(yardATLAddress, tokenToWei("100000"));
      await usdt.connect(user3).approve(acreATLAddress, tokenToWei("100000"));
      await usdt.connect(user3).approve(plotATLAddress, tokenToWei("100000"));
      await usdt.connect(user3).approve(yardATLAddress, tokenToWei("100000"));
      await usdt.connect(user1).approve(migratorAddress, tokenToWei("100000"));

      //mint genesis  token to users
      await acreATL.connect(user1).mint(5);
      await acreATL.connect(user2).mint(5);
      await acreATL.connect(user3).mint(5);
      await plotATL.connect(user1).mint(5);
      await plotATL.connect(user2).mint(5);
      await plotATL.connect(user3).mint(5);
      await yardATL.connect(user1).mint(5);
      await yardATL.connect(user2).mint(5);
      await yardATL.connect(user3).mint(5);

      //grant roles to deployer on the migrator
      let sgr = await migrator.SIGNER_ROLE();
      await migrator.connect(deployer).grantRole(sgr, deployerAddress);

      //grant the deployer signer role on the evt contracts
      sgr = await acreATLV2.SIGNER_ROLE();
      await acreATLV2.connect(deployer).grantRole(sgr, deployerAddress);
      await plotATLV2.connect(deployer).grantRole(sgr, deployerAddress);
      await yardATLV2.connect(deployer).grantRole(sgr, deployerAddress);
      await acreATLV2.connect(deployer).grantRole(sgr, migratorAddress);
      await plotATLV2.connect(deployer).grantRole(sgr, migratorAddress);
      await yardATLV2.connect(deployer).grantRole(sgr, migratorAddress);

      // create a batch on the evt contract
      await acreATLV2.connect(deployer).setCurrentBatch(104, tokenToWei('100'), true);
      await plotATLV2.connect(deployer).setCurrentBatch(60, tokenToWei('150'), true);
      await yardATLV2.connect(deployer).setCurrentBatch(2159, tokenToWei('300'), true);


      await migrator.connect(deployer).setERC721Requirements(acreATLAddress, yardATLAddress, plotATLAddress, acreATLV2Address, yardATLV2Address, plotATLV2Address);
      await migrator.connect(deployer).setTokenInfo(usdtAddress, prlzAddress,1);
    

      // it should set migrator as a free minter on evts
      await acreATLV2.connect(deployer).setFreeParticipant(migratorAddress, true);
      await plotATLV2.connect(deployer).setFreeParticipant(migratorAddress, true);
      await yardATLV2.connect(deployer).setFreeParticipant(migratorAddress, true);



      //user should approve the migrator on his genesis token
      await acreATL.connect(user1).setApprovalForAll(migratorAddress, true);
      await plotATL.connect(user1).setApprovalForAll(migratorAddress, true);
      await yardATL.connect(user1).setApprovalForAll(migratorAddress, true);

    
    return { deployer, user1, user2, user3, prlz, migrator, feeCollector, acreATL, plotATL, yardATL, acreATLV2, plotATLV2, yardATLV2, usdt, user1Address, user2Address, user3Address, acreATLAddress, plotATLAddress, yardATLAddress ,deployerAddress,acreATLV2Address, plotATLV2Address, yardATLV2Address,usdtAddress,prlzAddress,migratorAddress};



}



