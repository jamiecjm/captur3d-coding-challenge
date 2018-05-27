import React from "react"
import PropTypes from "prop-types"
import AddToCart from './AddToCart'

class CardboardShow extends React.Component {

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
    var line_item = {cardboard_id: this.props.id, quantity: this.state.quantity}
    $.post('/line_items',{
      line_item: line_item
    });
  }

  render () {
    return (
      <React.Fragment>
        <div className='cardboard-show-item'>
          <h3>{this.props.cardboard_type}</h3>
          <p>{this.props.price}</p>
        </div>
        <AddToCart quantity={this.state.quantity}
        onInput={this.handleUserInput.bind(this)}
        onFormSubmit={this.handleFormSubmit.bind(this)}/>
      </React.Fragment>
    );
  }
}

CardboardShow.propTypes = {
  cardboard_type: PropTypes.string,
  price: PropTypes.node
};
export default CardboardShow
