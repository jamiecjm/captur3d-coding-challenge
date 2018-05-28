import React from "react"
import PropTypes from "prop-types"
import OrderList from './OrderList'
import NoOrder from './NoOrder'

class Orders extends React.Component {

  render () {
    if (this.props.orders.length === 0){
      return <NoOrder/>
    } else {
      return <OrderList orders={this.props.orders} current_user={this.props.current_user}/>
    }
  }

}

export default Orders
