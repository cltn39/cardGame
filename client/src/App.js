import React, { Component } from "react";
import Player from './features/player';

class App extends Component {
  state = {
    response: '',
  };

  componentDidMount() {
    this.callApi()
    .then(res => this.setState({ response: res.express }))
    .catch(err => console.log(err));
  }

  render() {
    return (
      <div>
        <Player />
      </div>
    );
  }
}

export default App;
