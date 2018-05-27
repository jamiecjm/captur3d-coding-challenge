import React from "react"
import PropTypes from "prop-types"
import AddToCart from '../AddToCart'

class Cardboard extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      quantity: 1
    };
  }

  handleUserInput(obj){
    this.setState(obj)
  }

  handleFormSubmit(){
    var line_item = {cardboard_id: this.props.cardboard.id, quantity: this.state.quantity}
    $.post('/line_items',{
      line_item: line_item
    });
  }

  render () {
    return (
      <React.Fragment>
      <div className='cardboard-item'>
        <a href={this.props.cardboard.url}>
          <h3>{this.props.cardboard.cardboard_type}</h3>
        </a>
        <h4>AU ${this.props.cardboard.price}</h4>
        <AddToCart quantity={this.state.quantity}
        onInput={this.handleUserInput.bind(this)}
        onFormSubmit={this.handleFormSubmit.bind(this)}/>
      </div>
      </React.Fragment>
    );
  }
}

export default Cardboard
