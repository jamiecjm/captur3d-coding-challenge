import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
class Cart extends React.Component {


  render () {
    return (
      <React.Fragment>
        <h1>Your Cart</h1>
        <LineItemList line_items={this.props.line_items} />
      </React.Fragment>
    );
  }
}

export default Cart
