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
            <li><a href="/users/sign_up"><span className="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="/users/sign_in"><span className="glyphicon glyphicon-log-in"></span> Login</a></li>
            <li><a href="#"><span className="glyphicon glyphicon-briefcase"></span> Orders</a></li>
            <li><a href="/users/sign_out" data-method="delete"><span className="glyphicon glyphicon-log-out"></span> Logout</a></li>
          </ul>
        </div>
      </nav>
      </React.Fragment>
    );
  }
}

export default Navbar
