import React from "react"
import PropTypes from "prop-types"

class CartMeta extends React.Component {

  render () {
    return (
      <React.Fragment>
        <table className='table cart-meta'>
          <tbody>
            {this.props.cart_metas.map(function(meta){
              return(
                <tr key={meta.title}>
                  <th className='cart-meta-text'>{meta.title}</th>
                  <td className='cart-meta-number'>{meta.value}</td>
                </tr>
              )
            })}
          </tbody>
        </table>
        <a href='/checkout' className='btn btn-default'>Proceed to Checkout</a>
      </React.Fragment>
    );
  }
}

export default CartMeta
