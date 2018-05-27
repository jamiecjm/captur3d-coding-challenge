import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
class LineItemList extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      line_items: this.props.line_items
    }

    this.handleInputChange = this.handleInputChange.bind(this)
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

  handleInputChange(obj){
    this.props.onInputChange(obj);
  }

  render () {
    return (
      <React.Fragment>
            {this.state.line_items.map(function(line_item){
              return(
                <tr className='cart-line-item' key={line_item.id}>
                  <LineItem line_item={line_item}
                  onCrossClick={this.handleClick}
                  onInputChange={this.handleInputChange}/>
                </tr>
              )
            }, this)}
      </React.Fragment>
    );
  }
}

export default LineItemList
