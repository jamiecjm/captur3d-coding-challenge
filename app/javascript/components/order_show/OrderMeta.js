import React from "react"
import PropTypes from "prop-types"

class OrderMeta extends React.Component {

  render () {
    return (
      <React.Fragment>
        <table className='table cart-meta'>
          {this.props.order_metas.map(function(meta){
            return(
              <tr>
                <th className='cart-meta-text'>{meta.title}</th>
                <td className='cart-meta-number'>{meta.value}</td>
              </tr>
            )
          })}
        </table>
      </React.Fragment>
    );
  }
}

export default OrderMeta
