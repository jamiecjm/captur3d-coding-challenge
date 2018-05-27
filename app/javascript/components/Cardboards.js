import React from "react"
import PropTypes from "prop-types"
import CardboardList from './CardboardList'

class Cardboards extends React.Component {

  render () {
    return (
      <React.Fragment>
        <h1>Browse Cardboards</h1>
        <CardboardList cardboards={this.props.cardboards}/>
      </React.Fragment>
    );
  }
}

export default Cardboards
