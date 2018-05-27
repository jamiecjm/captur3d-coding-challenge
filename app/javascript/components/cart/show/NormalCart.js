import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
import CartMeta from './CartMeta'

class NormalCart extends React.Component {

  handleInputChange(obj){
    this.props.onInputChange(obj);
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
            <LineItemList line_items={this.props.line_items} onInputChange={this.handleInputChange.bind(this)}/>
          </tbody>
        </table>
        <CartMeta cart_metas={this.props.cart_metas} />
        <span className='clear'></span>
      </React.Fragment>
    );
  }
}

export default NormalCart
