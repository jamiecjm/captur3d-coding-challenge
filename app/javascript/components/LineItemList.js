import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
class LineItemList extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      line_items: this.props.line_items
    }
  }

  handleClick(line_item_id){
    var delete_url = '/line_items/'+line_item_id
    $.ajax({
        url: delete_url,
        type: 'DELETE',
        success: function(result) {
        }
    });
  }

  render () {
    return (
      <React.Fragment>
        <table className='table cart-line-item-list'>
          <thead>
            <tr>
              <th>Cardboard Type</th>
              <th>Quantity</th>
              <th>Unit Price</th>
              <th>Subtotal</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {this.props.line_items.map(function(line_item){
              return(
                <tr className='cart-line-item' key={line_item.id}>
                  <LineItem line_item={line_item} onCrossClick={this.handleClick}/>
                </tr>
              )
            }, this)}
          </tbody>
        </table>
      </React.Fragment>
    );
  }
}

export default LineItemList
