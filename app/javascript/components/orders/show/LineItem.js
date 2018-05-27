import React from "react"
import PropTypes from "prop-types"

class LineItem extends React.Component {

  render () {
    return (
      <React.Fragment>

        <td>{this.props.line_item.cardboard_type}</td>
        <td>{this.props.line_item.quantity}</td>
        <td>AU ${this.props.line_item.cardboard_price}</td>
      </React.Fragment>
    );
  }
}

export default LineItem
