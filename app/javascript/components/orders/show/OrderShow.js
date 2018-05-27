import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
import OrderMeta from './OrderMeta'

class OrderShow extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      order_metas: this.props.order_metas
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
            </tr>
          </thead>
          <tbody>
            <LineItemList line_items={this.props.line_items} />
          </tbody>
        </table>
        <OrderMeta order_metas={this.state.order_metas} />
        <span className='clear'></span>
      </React.Fragment>
    );
  }
}

export default OrderShow
