const Project = artifacts.require("ProjectOffice");

contract("ProjectOffice", (accounts) => {
 let projection;
 let expectedProject;

 before(async () => {
     projection = await Project.deployed();
 });

 describe("choosing a Project and retrieving account addresses", async () => {
   before("choose a Project using accounts[0]", async () => {
    //  await projection.assign(1, { from: accounts[0] });
     await projection.neededParts(1, 2, 8, 5, {from: accounts[0]} )
     expectedProject = accounts[0];
   });

  //  it("can fetch the address of an owner by pet id", async () => {
  //   const project = await projection.projects(1);
  //   assert.equal(project, expectedProject, "The owner of the adopted pet should be the first account.");
  // });

  //  it("can fetch the address of an owner by Project id", async () => {
  //   const projects = await projection.getAddresses();
  //   console.log(projects)
  //   assert.equal(projects[1], expectedProject, "The owner of the chosen Project should be the first account.");
  // });

  it("can fetch the collection of all Project owners' addresses", async () => {
    const parts = await projection.getProjects();
    console.log(parts)
    assert.isArray(parts, "The owner of the chosen Project should be in the collection.");
   });
 });
});