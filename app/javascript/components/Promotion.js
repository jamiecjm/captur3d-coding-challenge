import React from "react"
import PropTypes from "prop-types"

class Promotion extends React.Component {

  render () {
    return (
      <React.Fragment>
        <p>{this.props.promotion.description}</p>
      </React.Fragment>
    );
  }
}

export default Promotion
