<h1>Sorting Hat</h1>
<div class="row">
  <div class="col-md-8 col-xs-12">
    <table class="table">
      <thead>
        <tr>
          <th>
            Student
          </th>
          <th>
            Last Picked
          </th>
          <th>

          </th>
        </tr>
      </thead>
      <tbody>
        <% @users.each do |user| %>
          <tr>
            <td>
              <%= user.name %>
            </td>
            <td>
              <% unless user.picks.empty? %>
                <%= user.picks.order(picked_at: :desc).first.picked_at %>
              <% end %>
            </td>

            <td>
              <a href="/users/<%= user.id %>/edit">Edit</a>
            </td>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>

  <div class="col-md-4 col-xs-12">
    <form action="/pick" method="post">
      <input class="btn btn-success btn-block" type="submit" name="submit" value="Pick Student!">
    </form>

    <br>

    <div class="panel panel-success">


      <div class="panel-body">
        <h4><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add student</h4>
        <form class="" action="/users" method="post">
          <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" type="text" name="user[name]" value="" placeholder="Jane Smith">
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" id="email" type="text" name="user[email]" value="" placeholder="jobs@emails.com">
          </div>
          <div class="form-group">
            <label for="phone_number">Phone</label>
            <input class="form-control" type="text" name="user[phone_number]" value="" placeholder="(xxx) xxx-xxxx">
          </div>
          <input type="submit" name="submit" value="Save" class="btn btn-primary btn-block">
        </form>
      </div>
    </div>
  </div>
</div>
