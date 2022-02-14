edit.html.erb    - attendance form
index.html.erb   - view all members
new.html.erb     - events
show.html.erb    - home page

            <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Attendance Count</th>
            </tr>
            <% count = 0%>
            <% @users.each do |user| %>
                <% count = count+1%>
                <tr>
                    <td><%= count %></td>
                    <td><%= user.full_name %></td>
                    <td><%= user.email %></td>
                    <td><%= user.role %></td>
                    <td><%= user.attendance_count %></td>
                </tr>
            <% end %>
            </table>

#6 new users for testing (insert them into the console, user.save after each)

user = User.create(full_name: "tom", email: "tom@gmail.com", role: "member", attendance_count:"44")
user = User.create(full_name: "sara", email: "sara@gmail.com", role: "member", attendance_count:"22")
user = User.create(full_name: "michelle", email: "michelle@gmail.com", role: "member", attendance_count:"3")
user = User.create(full_name: "mary", email: "mary@gmail.com", role: "member", attendance_count:"5")
user = User.create(full_name: "lila", email: "lila@gmail.com", role: "member", attendance_count:"78")
user = User.create(full_name: "joe", email: "joe@gmail.com", role: "member", attendance_count:"4")