import React from "react"
import PropTypes from "prop-types"
import Cardboard from './Cardboard'
class CardboardList extends React.Component {
  render () {
    return (
      <React.Fragment>
      <div>
        {this.props.cardboards.map(function(cardboard){
          return(
            <Cardboard cardboard={cardboard} key={cardboard.id}/>
          )
        })}
      </div>
      </React.Fragment>
    );
  }
}

export default CardboardList
