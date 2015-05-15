$ ->
    $("#add-todo-item-button").click ->
        console.log 'add-todo-item-button clicked'
        content = "<div class='todo-item'>" + $('#add-todo-item-content').val() + "</div>"
        $("#todo-list").append content

    $("#todo-list").on "click", ".todo-item", ->
        console.log 'todo-item clicked'
        $(this).toggleClass 'todo-item-done'