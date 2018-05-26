import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
class LineItemList extends React.Component {
  render () {
    return (
      <React.Fragment>
      <div className='cart-line-item-list'>
        {this.props.line_items.map(function(line_item){
          return(
            <LineItem line_item={line_item} key={line_item.id}/>
          )
        })}
      </div>
      </React.Fragment>
    );
  }
}

export default LineItemList
