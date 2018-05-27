import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
class LineItemList extends React.Component {

  constructor(props){
    super(props);

    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleClick= this.handleClick.bind(this)
  }

  handleClick(line_item_id){
    this.props.onCrossClick(line_item_id);
  }

  handleInputChange(obj){
    this.props.onInputChange(obj);
  }

  render () {
    return (
      <React.Fragment>
            {this.props.line_items.map(function(line_item){
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
