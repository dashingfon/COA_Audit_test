const { ethers, upgrades } = require('hardhat');
const hre = require('hardhat');
import fs from "fs-extra";
import path from "path";

async function main() {
  const network_name = hre.network.name;
  const filePath = path.join(__dirname, "addresses", `${network_name}.json`);
  let addressesX = {} as any;

  if (fs.existsSync(filePath)) {
    addressesX = JSON.parse(fs.readFileSync(filePath, "utf8"));
  }
  console.log(addressesX)
  const [deployer] = await ethers.getSigners();
  const migrationSystemAddress = addressesX.MIGRATOR;
  const Migrator = await ethers.getContractFactory('Migrator');
  const upgraded = await upgrades.upgradeProxy(migrationSystemAddress, Migrator, []);
  console.log('Migrator upgraded instance:' + migrationSystemAddress);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
