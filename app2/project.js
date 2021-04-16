if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/39e77057ebbe4eb2a734b1952a340e1f"));
}

web3.eth.defaultAccount = web3.eth.accounts[0];

var ProjectOfficeContract = web3.eth.contract([
	{
		"constant": false,
		"inputs": [
			{
				"name": "projectId",
				"type": "uint256"
			}
		],
		"name": "assign",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "Batteries",
				"type": "uint256"
			},
			{
				"name": "Columns",
				"type": "uint256"
			},
			{
				"name": "Elevators",
				"type": "uint256"
			},
			{
				"name": "Floors",
				"type": "uint256"
			}
		],
		"name": "neededParts",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "oldOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnerSet",
		"type": "event"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAddresses",
		"outputs": [
			{
				"name": "",
				"type": "address[10]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getProjects",
		"outputs": [
			{
				"components": [
					{
						"name": "Controllers",
						"type": "uint256"
					},
					{
						"name": "Shafts",
						"type": "uint256"
					},
					{
						"name": "Doors",
						"type": "uint256"
					},
					{
						"name": "Buttons",
						"type": "uint256"
					},
					{
						"name": "Displays",
						"type": "uint256"
					},
					{
						"name": "Pulleys",
						"type": "uint256"
					}
				],
				"name": "",
				"type": "tuple[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "projects",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]);

var ProjectOffice = ProjectOfficeContract.at('0x39C294A92B591e79A7be7B394DFa65C9123641dF');
console.log(ProjectOffice);

ProjectOffice.getProjects(function(error, result){
    if(!error)
        {
            $("#parts").html(result[0]);//(result[0]+' Controller(s) '+result[1]+' Shaft(s) '+result[2]+' Door(s)'+result[3]+'  '+result[4]+'  '+result[5]+' Pulley(ies)');
            console.log(result);
        }
    else
        console.error(error);
});
$("#button").click(function() {
    ProjectOffice.neededParts($("#battery").val(), $("#column").val(), $("#elevator").val(), $("#floor").val());
});