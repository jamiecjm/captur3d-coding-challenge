import React from "react"
import PropTypes from "prop-types"
class UpdateCart extends React.Component {

  handleInputChange(e){
    var quantity = e.target.value
    if (quantity < 1){
      quantity = 1
    }
    this.props.onInputChange(quantity);
  }


  render () {
    return (
      <React.Fragment>
      <div>
          <input className='form-control' name='quantity' type='number' min='1'
          value={this.props.quantity}
          onChange={this.handleInputChange.bind(this)}/>
      </div>
      </React.Fragment>
    );
  }
}

export default UpdateCart
