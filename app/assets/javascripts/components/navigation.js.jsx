var Navigation = React.createClass({

  loggedIn: function () {
    if (this.props.user === null) {
      return <span>
        <li><a href="/users/new">Sign Up</a></li>
        <li><a href="/sessions/sign_in">Sign In</a></li>
      </span>
    } else {
      return <span>
        <li><a href={"/users/" + this.props.user.id + "/edit"}>Profile</a></li>
        <li><a href="/sessions/sign_out" data-method="DELETE">Sign Out</a></li>
      </span>
    }
  },

  render: function() {
    return (
      <div>
        <div className="row">
          <div className="col 2">
              {this.props.cheeses.map(function (cheese) {
                 return (<a key={cheese.id} className="header-board" href={"/cheeses/" + cheese.id}>{cheese.name}</a>);
               })}
          </div>
        </div>

        <nav>
          <div className="nav-wrapper">
            <a className="big" href="/">Mouse House</a>
            <ul id="nav-mobile" className="right">
              <li><a href="/cheeses/new">New Cheese</a></li>
              <li><a href="/user_cheeses">Favs</a></li>
              {this.loggedIn()}
            </ul>
          </div>
        </nav>
      </div>
    );
  }
});
