import React from "react"
import PropTypes from "prop-types"
import LineItem from './LineItem'
class LineItemList extends React.Component {


  render () {
    return (
      <React.Fragment>
            {this.props.line_items.map(function(line_item){
              return(
                <tr className='cart-line-item' key={line_item.id}>
                  <LineItem line_item={line_item}/>
                </tr>
              )
            }, this)}
      </React.Fragment>
    );
  }
}

export default LineItemList
