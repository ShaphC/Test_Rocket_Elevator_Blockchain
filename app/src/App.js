import React, { Component } from 'react'
import Web3 from 'web3'
import Greeter from './artifacts/Greeter.json'
import './App.css'

class App extends Component {

  componentDidMount() {
    this.loadBlockchainData()
  }

  async loadBlockchainData() {
    const web3 = new Web3(Web3.givenProvider)
    const accounts = await web3.eth.requestAccounts()
    this.setState({
      account: accounts[0],
      address: Greeter["networks"]['5777']['address']
    })
    const greeterAddress = Greeter["networks"]['5777']['address'];
    const greeterContract = new web3.eth.Contract(Greeter['abi'], greeterAddress)
    console.log(greeterContract)
  }

  constructor(props) {
    super(props)
    this.state = {
      account: ''
    }
  }

  render() {
    return (
      <div>
        <div className="container-fluid">
          <div className="row">
            <h1 className="col-lg-12 d-flex justify-content-center">Rocket Elevators Blockchain Contracts</h1>

            <br />
            <br />
            <br />
            <br />

            <h2 className="col-lg-12 d-flex justify-content-center">Project Office Contract</h2>
            <main role="main" className="col-lg-12 d-flex justify-content-center">
              <div id="content">
                <form>
                  <input id="battery" type="text" className="form-control" placeholder="Enter the number of batteries required" required />
                  <br />
                  <input id="column" type="text" className="form-control" placeholder="Enter the number of columns required" required />
                  <br />
                  <input id="elevator" type="text" className="form-control" placeholder="Enter the number of elevators required" required />
                  <br />
                  <input id="floorsServed" type="text" className="form-control" placeholder="Enter the number of floors to be served" required />
                  <br />
                  <button className='btn btn-primary col-lg-12 d-flex justify-content-center' type='button'>Submit</button>
                </form>
              </div>
            </main>
          </div>
        </div>

        <br />
        <br />

        <div className="container-fluid">
          <div className="row">
            <h2 className="col-lg-12 d-flex justify-content-center">Material Provider Contract</h2>
            <main role="main" className="col-lg-12 d-flex justify-content-center">
              <div id="content">
                <form>
                  <input id="newGreeting" type="text" className="form-control" placeholder="Add greeting" required />
                  <br />
                  <button className='btn btn-primary col-lg-12 d-flex justify-content-center' type='button'>Submit</button>
                </form>
              </div>
            </main>
          </div>
        </div>

        <br />
        <br />

        <div className="container-fluid">
          <div className="row">
            <h2 className="col-lg-12 d-flex justify-content-center">Solution Manufacturing Contract</h2>
            <main role="main" className="col-lg-12 d-flex justify-content-center">
              <div id="content">
                <form>
                  <input id="newGreeting" type="text" className="form-control" placeholder="Add greeting" required />
                  <br />
                  <button className='btn btn-primary col-lg-12 d-flex justify-content-center' type='button'>Submit</button>
                </form>
              </div>
            </main>
          </div>
        </div>

        <br />
        <br />

        <div className="container-fluid">
          <div className="row">
            <h2 className="col-lg-12 d-flex justify-content-center">Quality, Security, and Homologation Contract</h2>
            <main role="main" className="col-lg-12 d-flex justify-content-center">
              <div id="content">
                <form>
                  <input id="newGreeting" type="text" className="form-control" placeholder="Add greeting" required />
                  <br />
                  <button className='btn btn-primary col-lg-12 d-flex justify-content-center' type='button'>Submit</button>
                </form>
              </div>
            </main>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
