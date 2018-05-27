import React from "react"
import PropTypes from "prop-types"
import Cardboard from './Cardboard'
class CardboardList extends React.Component {
  render () {
    return (
      <React.Fragment>

        {this.props.cardboards.map(function(cardboard){
          return(
            <Cardboard cardboard={cardboard} key={cardboard.id}/>
          )
        })}

      </React.Fragment>
    );
  }
}

export default CardboardList
