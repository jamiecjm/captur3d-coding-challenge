import React from "react"
import PropTypes from "prop-types"
import NormalCart from './NormalCart'
import EmptyCart from './EmptyCart'
class Cart extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      cart_metas: this.props.cart_metas,
      line_items: this.props.line_items
    }
  }

  handleInputChange(obj){
    var update_url = '/line_items/' + obj.id
    $.ajax({
        url: update_url,
        type: 'PUT',
        data: obj,
        success: function(result) {
        }
    });
  }

  render () {
    if (this.state.line_items.length === 0){
      return <EmptyCart />
    } else {
      return <NormalCart
      cart_metas={this.state.cart_metas}
      line_items={this.state.line_items}
      onInputChange={this.handleInputChange}
      />
    }
  }
}

export default Cart
