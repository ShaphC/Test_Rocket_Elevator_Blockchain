if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

web3.eth.defaultAccount = web3.eth.accounts[0];

var ProjectOfficeContract = web3.eth.contract([
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
		"inputs": [],
		"name": "projectResult",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
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
		"name": "returnParts",
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
	}
]);

//Addresses of different contracts
var projectOfficeAddress = '0xea5f496E8948b802CFae6BBf1055d02E216f6595'
var materialProviderAddress = '0x8054856311FF149F384a04B5B46864CD667a0e3D'
var solutionManufacturingAddress = 'Place address to be sent here'
var qualityAddress = 'Place address to be sent here'

var ProjectOffice = ProjectOfficeContract.at(projectOfficeAddress);
console.log(ProjectOffice);

ProjectOffice.projectResult(function(error, result){
    if(!error)
        {
            $("#parts").html(result[0]+' Controller(s), '+result[1]+' Shaft(s), '+result[2]+' Door(s),\n'+result[3]+' Button(s),'+result[4]+' Display(s), '+result[5]+' Pulley(ies)');
            console.log(result);
        }
    else
        console.error(error);
});

//Variable to get passed with API calls
var data = {}

$("#project-office-button").click(function() {
    ProjectOffice.neededParts($("#battery").val(), $("#column").val(), $("#elevator").val(), $("#floor").val());

	var address = projectOfficeAddress

	$.ajax({
		type: 'POST',
		headers: {'content-type': 'application/json', 'accept': '*/*', 'Access-Control-Allow-Origin': '*'},
		url: 'https://rest-api-burroughs.herokuapp.com/api/blockchain/project-office/' + address,
		data: JSON.stringify(data)
	})
});

var MaterialContract = web3.eth.contract();

$("#material-provider-button").click(function() {

	var address = materialProviderAddress
	$.ajax({
		type: 'POST',
		headers: {'content-type': 'application/json', 'accept': '*/*', 'Access-Control-Allow-Origin': '*'},
		url: 'https://rest-api-burroughs.herokuapp.com/api/blockchain/material-provider/' + address,
		data: JSON.stringify(data)
	})
});


var SolutionsContract = web3.eth.contract();

$("#solution-manufacturing-button").click(function() {

	var address = solutionManufacturingAddress
	$.ajax({
		type: 'POST',
		headers: {'content-type': 'application/json', 'accept': '*/*', 'Access-Control-Allow-Origin': '*'},
		url: 'https://rest-api-burroughs.herokuapp.com/api/blockchain/solution-manufacturing/' + address,
		data: JSON.stringify(data)
	})
});


var QualtiyContract = web3.eth.contract();

$("#quality-button").click(function() {
	
	var address = qualityAddress
	$.ajax({
		type: 'POST',
		headers: {'content-type': 'application/json', 'accept': '*/*', 'Access-Control-Allow-Origin': '*'},
		url: 'https://rest-api-burroughs.herokuapp.com/api/blockchain/quality-security/' + address,
		data: JSON.stringify(data)
	})
});