import React from "react"
import PropTypes from "prop-types"

class LineItem extends React.Component {

  render () {
    return (
      <React.Fragment>

        <h3>{this.props.line_item.cardboard_type}</h3>
        <p>{this.props.line_item.quantity}</p>
        <p>{this.props.line_item.price}</p>

      </React.Fragment>
    );
  }
}

export default LineItem
