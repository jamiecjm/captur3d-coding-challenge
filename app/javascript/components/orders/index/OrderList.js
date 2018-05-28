import React from "react"
import PropTypes from "prop-types"
import Order from './Order'

class OrderList extends React.Component {

  render () {
    return (
      <React.Fragment>
      <table className='table'>
        <thead>
          <tr>
            <th>Order number</th>
            <th>No. of Items</th>
            <th>Total</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {this.props.orders.map(function(order){
            return(
              <Order order={order}  current_user={this.props.current_user} key={order.id}/>
            )
          }, this)}
        </tbody>
      </table>
      </React.Fragment>
    );
  }
}

export default OrderList
