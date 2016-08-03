var Cheese = React.createClass({

  render: function() {
    return (
      <div className="hlable">
        <div className="row">
          <a data-id={this.props.cheese.id} className="cheese col 12" data-remote="true" rel="nofollow" data-method="POST" href={"/upvotes?user_cheese%5Blink_id%5D=" + this.props.cheese.id + "&amp;user_cheese%5Buser_id%5D=1"}>
            "Favorite"
          </a>
        </div>

        <div className="row">
          <div className="vote_count col 2">
            {this.props.link.upvotes_count - this.props.link.downvotes_count}
          </div>
          <div className="col 2">
          <a href={"/links/" + this.props.link.id}>{this.props.link.title}</a>
          </div>
        </div>
      </div>
    );
  }
});
