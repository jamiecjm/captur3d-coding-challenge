import React from "react"
import PropTypes from "prop-types"

class Order extends React.Component {

  render () {
    return (
      <React.Fragment>
        <tr>
          <td>#{this.props.order.id}</td>
          <td>{this.props.order.item_count}</td>
          <td>AU ${this.props.order.grand_total}</td>
          <td><a href={'/users/'+this.props.current_user.id+'/orders/'+this.props.order.id}>Show</a></td>
        </tr>
      </React.Fragment>
    );
  }
}

export default Order
