import React from "react"
import PropTypes from "prop-types"


class EmptyCart extends React.Component {

  render () {
    return (
      <React.Fragment>
        <div className='alert alert-info'>
          There is no item in your cart
        </div>
        <a href='/'>Continue Shopping</a>
      </React.Fragment>
    );
  }
}

export default EmptyCart
