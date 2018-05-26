import React from "react"
import PropTypes from "prop-types"

class Navbar extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      current_order: this.props.current_order,
      item_count: this.props.current_order.item_count
    };
  }

  changeItemCount(new_item){
    this.state.item_count += new_item.quantity
    this.setState({item_count: this.props.item_count})
  }

  render () {
    return (
      <React.Fragment>

      <nav className="navbar navbar-default">
        <div className="container">
          <div className="navbar-header">
            <a className="navbar-brand" href="/">CAPTUR3D Code Challenge</a>
          </div>
          <ul className="nav navbar-nav">
          </ul>
          <ul className="nav navbar-nav navbar-right">
            <li><a href="/cart"><span className="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
          </ul>
        </div>
      </nav>
      </React.Fragment>
    );
  }
}

export default Navbar
