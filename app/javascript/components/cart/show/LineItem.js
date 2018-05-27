import React from "react"
import PropTypes from "prop-types"
import UpdateCart from './UpdateCart'

class LineItem extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      id: this.props.line_item.id,
      quantity: this.props.line_item.quantity,
      cardboard_id: this.props.line_item.cardboard_id,
      cardboard_type: this.props.line_item.cardboard_type,
      cardboard_price: this.props.line_item.cardboard_price
    }

    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleClick= this.handleClick.bind(this)
  }

  handleClick(){
    this.props.onCrossClick(this.state.id);
  }

  handleInputChange(quantity){
    var obj = {
      id: this.state.id,
      quantity: quantity,
      cardboard_id: this.state.cardboard_id
    }
    this.setState({quantity: obj.quantity})
    this.props.onInputChange(obj);
  }

  render () {
    return (
      <React.Fragment>

        <td>{this.state.cardboard_type}</td>
        <td>
        <UpdateCart
        quantity={this.state.quantity}
        cardboard_id={this.state.cardboard_id}
        onInputChange={this.handleInputChange}/>
        </td>
        <td>AU ${this.state.cardboard_price}</td>
        <td>
          <a className='glyphicon glyphicon-remove'
          onClick={this.handleClick}></a>
        </td>
      </React.Fragment>
    );
  }
}

export default LineItem
