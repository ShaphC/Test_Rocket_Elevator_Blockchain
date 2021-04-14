const Project = artifacts.require("ProjectOffice");

contract("ProjectOffice", (accounts) => {
 let projection;
 let expectedProjectId;

 before(async () => {
     projection = await Project.deployed();
 });

 describe("adopting a Project and retrieving account addresses", async () => {
   before("adopt a Project using accounts[0]", async () => {
     await projection.project(1, { from: accounts[0] });
     expectedProject = accounts[0];
   });

   it("can fetch the address of an owner by Project id", async () => {
    const project = await projection.projects(1);
    assert.equal(project, expectedProject, "The owner of the adopted Project should be the first account.");
  });

  it("can fetch the collection of all Project owners' addresses", async () => {
    const projects = await projection.getProjects();
    assert.equal(projects[1], expectedProject, "The owner of the adopted Project should be in the collection.");
   });
   it("can fetch the collection of all Project owners' addresses", async () => {
    const projects = await projection.getProjects();
    assert.equal(projects[1], expectedProject, "The owner of the Project should be in the collection.");
   });
 });
});