import React from "react"
import PropTypes from "prop-types"
import NormalCart from './NormalCart'
import EmptyCart from './EmptyCart'
class Cart extends React.Component {

  render () {
    if (this.props.line_items.length === 0){
      return <EmptyCart />
    } else {
      return <NormalCart
      cart_metas={this.props.cart_metas}
      line_items={this.props.line_items}
      />
    }
  }
}

export default Cart
