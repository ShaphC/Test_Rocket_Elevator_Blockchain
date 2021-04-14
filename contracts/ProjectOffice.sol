pragma solidity >=0.4.22 <0.9.0;

contract ProjectOffice {
  address[4] public projects;

  function project(uint projectId) public returns (uint) {
    // require(projectId >= 0 && projectId <= 15);

    projects[projectId] = msg.sender;

    return projectId;
  }
  
  // Retrieving the adopters
  function getProjects() public view returns (address[4] memory) {
    return projects;
  }
}
