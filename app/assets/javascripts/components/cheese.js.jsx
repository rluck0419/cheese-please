var Cheese = React.createClass({

  render: function() {
    return (
      <div className="hlable">
        <div className="row">
          <a data-id={this.props.cheese.id} className="col 12" data-remote="true" rel="nofollow" data-method="POST" href={"/user_cheese?user_cheese%5Bcheese_id%5D=" + this.props.cheese.id + "&amp;user_cheese%5Buser_id%5D=1"}>
            <i className="material-icons favorite">thumb_up</i>
          </a>
          <a className="col 12" href={"/cheeses/" + this.props.cheese.id}>{this.props.cheese.name}</a>
        </div>
      </div>
    );
  }
});
