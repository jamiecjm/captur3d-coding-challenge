import React from "react"
import PropTypes from "prop-types"
class Navbar extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      current_order: this.props.current_order
    };
  }

  render () {
    return (
      <React.Fragment>
        <nav>
          <ul>
            <li>{this.state.current_order.item_count}</li>
          </ul>
        </nav>
      </React.Fragment>
    );
  }
}

export default Navbar
