import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
import CartMeta from './CartMeta'

class NormalCart extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      cart_metas: this.props.cart_metas
    }
  }

  render () {
    return (
      <React.Fragment>
        <table className='table cart-line-item-list'>
          <thead>
            <tr>
              <th>Cardboard Type</th>
              <th>Quantity</th>
              <th>Price</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <LineItemList line_items={this.props.line_items} />
          </tbody>
        </table>
        <CartMeta cart_metas={this.state.cart_metas} />
        <span className='clear'></span>
      </React.Fragment>
    );
  }
}

export default NormalCart
