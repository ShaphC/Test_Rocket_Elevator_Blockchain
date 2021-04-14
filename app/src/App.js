import React from 'react'
import { Drizzle } from '@drizzle/store'
import { DrizzleContext } from '@drizzle/react-plugin'
import Greeter from './artifacts/Greeter.json'
import './App.css'

const options = {
  contracts: [
    Greeter
  ]
}

const greeter = new Drizzle(options)

function App() {
  return (
      <div className="App">
        <header className="App-header">
          <h2>Hello World!</h2>
        </header>
      </div>
  );
}

export default App;
