import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
class Cart extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      item_total: this.props.current_order.item_total,
      promo_total: this.props.current_order.promo_total,
      shipment_total: this.props.current_order.shipment_total,
      total: this.props.current_order.grand_total
    }
  }

  render () {
    return (
      <React.Fragment>
        <h1>Your Cart</h1>
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
        <div className='cart-meta'>
          <div>
            <span className='cart-meta-text'>Subtotal</span>
            <span className='cart-meta-number'>{this.state.item_total}</span>
          </div>
          <div>
            <span className='cart-meta-text'>Discount</span>
            <span className='cart-meta-number'>{this.state.promo_total}</span>
          </div>
          <div>
            <span className='cart-meta-text'>Shipping Fee</span>
            <span className='cart-meta-number'>{this.state.shipment_total}</span>
          </div>
          <div>
            <span className='cart-meta-text'>Total</span>
            <span className='cart-meta-number'>{this.state.total}</span>
          </div>
          <a href='/checkout'>Proceed to Checkout</a>
        </div>
        <span className='clear'></span>
      </React.Fragment>
    );
  }
}

export default Cart
