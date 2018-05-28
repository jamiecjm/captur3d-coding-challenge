import React from "react"
import PropTypes from "prop-types"

class OrderMeta extends React.Component {

  render () {
    return (
      <React.Fragment>
      <table className='table cart-meta'>
        <tbody>
          {this.props.order_metas.map(function(meta){
            return(
              <tr key={meta.title}>
                <th className='cart-meta-text'>{meta.title}</th>
                <td className='cart-meta-number'>AU ${Math.abs(meta.value)}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
      </React.Fragment>
    );
  }
}

export default OrderMeta
