async function main() {
  const MusicNftContractFactory = await hre.ethers.getContractFactory("MusicNft");
  const MusicNftContract = await MusicNftContractFactory.deploy();

  await MusicNftContract.deployed();

  console.log("Contract deployed to:", MusicNftContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
