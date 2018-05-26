import React from "react"
import PropTypes from "prop-types"
class AddToCart extends React.Component {

  handleChange(e){
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
    this.props.onInput(obj);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.onFormSubmit();
  }

  render () {
    return (
      <React.Fragment>
      <div>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input name='quantity' type='number'
          value={this.props.quantity}
          onChange={this.handleChange.bind(this)}/>

          <input type='submit' value='Add to Cart'/>

        </form>
      </div>
      </React.Fragment>
    );
  }
}

export default AddToCart
