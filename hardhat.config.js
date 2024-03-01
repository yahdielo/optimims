require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
 	solidity: "0.8.19",
	network: {
		url: `https://opt-sepolia.g.alchemy.com/v2/${process.env.OP_SEMPOLIA}`,
	 	accounts: [process.env.KINGDINO_PK]
	}
};
