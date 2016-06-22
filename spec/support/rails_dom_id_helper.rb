module RailsDomIdHelper
  def dom_id_for(model)
    ["#", ActionView::RecordIdentifier.dom_id(model)].join
  end
end





# <h1><%= @todo_list.title %></h1>
#
# <ul class="todo_items">
#   <% @todo_list.todo_items.each do |todo_item| %>
#   <li id="<%= dom_id(todo_item) %>">
#     <%= todo_item.content %>
#     <%= link_to "Edit", edit_todo_list_todo_item_path(todo_item) %>
#     <%= link_to "Delete", todo_list_todo_item_path(todo_item), method: :delete, data: { confirm: "Are you sure?" } %>
#   </li>
#   <% end %>
# </ul>
#
# <p>
#   <%= link_to "New Todo Item", new_todo_list_todo_item_path %>
# </p>
