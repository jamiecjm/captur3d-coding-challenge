import React from "react"
import PropTypes from "prop-types"
import OrderList from './OrderList'

class Orders extends React.Component {

  render () {
    return (
      <React.Fragment>
        <OrderList orders={this.props.orders} current_user={this.props.current_user}/>
      </React.Fragment>
    );
  }
}

export default Orders
