import hre, { ethers } from "hardhat";
import fs from "fs-extra";
import path from "path";

async function main() {
    const network = hre.network.name;
    const filePath = path.join(__dirname, "addresses", `${network}.json`);
    let addresses = {} as any;

    if (fs.existsSync(filePath)) {
        addresses = JSON.parse(fs.readFileSync(filePath, "utf8"));
    }

    const Migrator = await ethers.getContractFactory('Migrator');
    const migrationSystem = await hre.upgrades.deployProxy(Migrator, []);
    await migrationSystem.deploymentTransaction()?.wait();
    const migrationSystemAddress = await migrationSystem.getAddress();
    addresses["MIGRATOR"] = migrationSystemAddress;
    console.log('Migration System Address : ', migrationSystemAddress);


    fs.writeFileSync(filePath, JSON.stringify(addresses, null, 2));

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
