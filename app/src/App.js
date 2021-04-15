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
        <h1>Hello, World!</h1>
        <p>Your account: {this.state.account}</p>
        <p>Greeter address: {this.state.address}</p>

        <div className="container-fluid">
          <div className="row">
            <main role="main" className="col-lg-12 d-flex justify-content-center">
              <div id="content">
                <form>
                  <input id="newGreeting" type="text" className="form-control" placeholder="Add greeting" required />
                  <button className='btn btn-primary' type='button'>Submit</button>
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
