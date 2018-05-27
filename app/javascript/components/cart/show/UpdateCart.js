import React from "react"
import PropTypes from "prop-types"
class UpdateCart extends React.Component {

  handleInputChange(e){
    this.props.onInputChange(e.target.value);
  }

  handleSubmit(e){
    e.preventDefault();
  }

  render () {
    return (
      <React.Fragment>
      <div>
        <form onSubmit={this.handleSubmit}>
          <input name='quantity' type='number' min='1'
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
