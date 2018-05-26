import React from "react"
import PropTypes from "prop-types"

class LineItem extends React.Component {

  handleClick(){
    this.props.onCrossClick(this.props.line_item.id);
  }

  render () {
    return (
      <React.Fragment>

        <td>{this.props.line_item.cardboard_type}</td>
        <td>{this.props.line_item.quantity}</td>
        <td>{this.props.line_item.cardboard_price}</td>
        <td>{this.props.line_item.price}</td>
        <td>
          <a className='glyphicon glyphicon-remove'
          onClick={this.handleClick.bind(this)}></a>
        </td>
      </React.Fragment>
    );
  }
}

export default LineItem
