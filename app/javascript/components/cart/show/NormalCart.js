import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
import CartMeta from './CartMeta'

class NormalCart extends React.Component {

  constructor(props){
    super(props);
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleClick= this.handleClick.bind(this);
  }

  handleInputChange(obj){
    this.props.onInputChange(obj);
  }

  handleClick(line_item_id){
    this.props.onCrossClick(line_item_id);
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
            <LineItemList line_items={this.props.line_items}
            onInputChange={this.handleInputChange}
            onCrossClick={this.handleClick}/>
          </tbody>
        </table>
        <CartMeta cart_metas={this.props.cart_metas} />
        <span className='clear'></span>
      </React.Fragment>
    );
  }
}

export default NormalCart
