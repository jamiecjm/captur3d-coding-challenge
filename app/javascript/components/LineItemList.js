import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
import RemoveLineItem from './RemoveLineItem'
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
        <div className='cart-line-item-list'>
          {this.props.line_items.map(function(line_item){
            return(
              <div className='cart-line-item' key={line_item.id}>
                <LineItem line_item={line_item}/>
                <RemoveLineItem onCrossClick={this.handleClick} line_item_id={line_item.id}/>
              </div>
            )
          }, this)}
        </div>
      </React.Fragment>
    );
  }
}

export default LineItemList
