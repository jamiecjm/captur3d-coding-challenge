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

  handleSubmit(e){
    e.preventDefault();
  }

  render () {
    return (
      <React.Fragment>
      <div>
        <form onSubmit={this.handleSubmit}>
          <input className='form-control' name='quantity' type='number' min='1'
          value={this.props.quantity}
          onChange={this.handleInputChange.bind(this)}/>
          <input name='cardboard_id' type='hidden' value={this.props.cardboard_id}/>
        </form>
      </div>
      </React.Fragment>
    );
  }
}

export default UpdateCart
