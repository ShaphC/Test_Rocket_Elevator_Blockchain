# Week 12 - Rocket_Elevators_Blockchain - Codeboxx

Members:
1. Ahsan Ali Syed
2. Don D. Nyguen 
3. Kaelen Burroughs
4. Olaolu Adetula
5. Timothy Wever
6. Shphan Charles

Coaches:
1. Serge Savoie
2. Thomas Carrier
-------------------------------------------------------------------------

# Project Components:

1. Four Smart contracts
2. Web Application 
3. New Database Table 

# Smart Contracts:

1. Project Office


2. Material Provider


3. Solution Manufacturing


4. Quality, Security and Homologation



# Web Application

All buttons in the web app are set to call an endpoint in the API specific to the form they are a part of that submits the name of the contract, and the contract address.

# New Database Table

For the new table, Don created a migration to create a table named blockchain. Kaelen took the migration file and deployed it to his database on the live CodeBoxx Amazon server in the database named KaelenBurroughs. The database table is updated through Kaelen's REST API, found at: https://rest-api-burroughs.herokuapp.com, and the code can be seen at the private repo here: https://github.com/ACLTearr/Rest-API-Rocket-Elevators.git. There were 5 endpoints added. One endpoint to post to the database for each contract, and one endpoint to get all of the contracts of a given project name.

-------------------------------------------------------------------------
# How to Start Application
Requirements: 
*Metamask google chrome extension

1. Copy or download the smart contracts in the contracts folder.
2. Paste them into Remix IDE, make suere to compile each contract before deploying
3. Now on the deploymewnt tab - set your connection from the Javascript VM to Injected Web3
4. Metamask should pop up make sure you have configured Metamask properly and that your account is on the Ropsten Network
5. Copy the address of your own account wallet- goto https://faucet.ropsten.be/ - paste in your address in the link and you'll recieve 1 free fake ether to use.
6. Once we have the ether we can then go back to remix and deploy all of our contracts.
7. Remember to copy the 'to: address' from the Projectoffice contract and to paste it into the address field for the MaterialProvider 
8. Then the 'to: address' for MaterialProvider needs to go into the SolutionManufacturing smart contract and then repeat the previous step but with SolutionManufacturing and our last contract - Qaulity, Security and Homologation.
