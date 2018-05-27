import React from "react"
import PropTypes from "prop-types"

class CartMeta extends React.Component {

  render () {
    return (
      <React.Fragment>
        <div className='cart-meta'>
          {this.props.cart_metas.map(function(meta){
            return(
              <div>
                <span className='cart-meta-text'>{meta.title}</span>
                <span className='cart-meta-number'>{meta.value}</span>
              </div>
            )
          })}
          <a href='/checkout'>Proceed to Checkout</a>
        </div>
      </React.Fragment>
    );
  }
}

export default CartMeta
