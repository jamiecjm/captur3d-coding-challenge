import React from "react"
import PropTypes from "prop-types"
import NormalCart from './NormalCart'
import EmptyCart from './EmptyCart'
class Cart extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      cart_metas: this.props.cart_metas,
      line_items: this.props.line_items,
      item_count: this.props.item_count
    }

    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleClick= this.handleClick.bind(this)
  }

  handleInputChange(obj){
    var update_url = '/line_items/' + obj.id
    $.ajax({
        url: update_url,
        type: 'PUT',
        data: {line_item: obj},
        success: function(result) {
          this.setState(result);
        }.bind(this)
    });
  }

  handleClick(line_item_id){
    var delete_url = '/line_items/'+line_item_id
    $.ajax({
        url: delete_url,
        type: 'DELETE',
        success: function(result) {
          this.setState(result);
        }.bind(this)
    });
  }

  render () {
    if (this.state.line_items.length === 0){
      return <EmptyCart item_count={this.state.item_count}/>
    } else {
      return <NormalCart
        cart_metas={this.state.cart_metas}
        line_items={this.state.line_items}
        item_count={this.state.item_count}
        onInputChange={this.handleInputChange}
        onCrossClick={this.handleClick}
      />
    }
  }
}

export default Cart
