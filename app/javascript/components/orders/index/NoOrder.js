import React from "react"
import PropTypes from "prop-types"


class NoOrder extends React.Component {

  render () {
    return (
      <React.Fragment>
        <div className='alert alert-info'>
          No order has been placed yet.
        </div>
        <a href='/' className='btn btn-default'>Continue Shopping</a>
      </React.Fragment>
    );
  }
}

export default NoOrder
