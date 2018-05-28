import React from "react"
import PropTypes from "prop-types"


class EmptyCart extends React.Component {

  render () {
    return (
      <React.Fragment>
        <h1>Your Cart {'('+this.props.item_count+')'}</h1>
        <div className='alert alert-info'>
          There is no item in your cart
        </div>
        <a href='/' className='btn btn-default'>Continue Shopping</a>
      </React.Fragment>
    );
  }
}

export default EmptyCart
