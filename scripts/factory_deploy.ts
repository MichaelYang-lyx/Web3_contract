import { ethers } from "hardhat";
async function main() {

	const [deployer] = await ethers.getSigners();


    console.log("Deployer address:", deployer.address);
	console.log("Account balance:", (await deployer.getBalance()).toString());
	
    

	const _initialSupply = (10)
	
	const Token = await ethers.getContractFactory("Token");
	const contract = await Token.deploy(_initialSupply, "Name", "Tiker");

	console.log("Token deployed at:", contract.address);
	
	
    const TokenFactory = await ethers.getContractFactory("TokenFactory");
	const factory = await TokenFactory.deploy();

	console.log("Factory deployed at:", factory.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
	console.error(error);
	process.exit(1);
  });