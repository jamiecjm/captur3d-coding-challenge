import React from "react"
import PropTypes from "prop-types"
class Cardboard extends React.Component {
  render () {
    return (
      <React.Fragment>
      <a href={this.props.cardboard.url} className='cardboard-item'>
        <h3>{this.props.cardboard.cardboard_type}</h3>
        <p>{this.props.cardboard.price}</p>
      </a>
      </React.Fragment>
    );
  }
}

export default Cardboard
