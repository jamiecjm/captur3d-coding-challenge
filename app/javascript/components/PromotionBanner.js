import React from "react"
import PropTypes from "prop-types"
import Promotion from "./Promotion"

class PromotionBanner extends React.Component {

  render () {
    return (
      <React.Fragment>
        <div className='promotion-banner'>
          <div className='container'>
          {this.props.promotions.map(function(promotion){
            return(
              <Promotion promotion={promotion} key={promotion.id}/>
            )
          })}
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default PromotionBanner
