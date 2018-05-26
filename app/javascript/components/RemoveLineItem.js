import React from "react"
import PropTypes from "prop-types"
class RemoveLineItem extends React.Component {

  handleClick(){
    this.props.onCrossClick(this.props.line_item_id);
  }

  render () {
    return (
      <React.Fragment>
      <div className='glyphicon glyphicon-remove'
      onClick={this.handleClick.bind(this)}></div>
      </React.Fragment>
    );
  }
}

export default RemoveLineItem
