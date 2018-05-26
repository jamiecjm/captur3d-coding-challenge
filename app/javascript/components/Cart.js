import React from "react"
import PropTypes from "prop-types"
import LineItemList from './LineItemList'
class Cart extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      line_items: this.props.line_items
    }
  }

  render () {
    return (
      <React.Fragment>
        <LineItemList line_items={this.state.line_items}/>
      </React.Fragment>
    );
  }
}

export default Cart
