$ ->
    todoItemTemplateSource = $('#todo-item-template').html()
    todoItemTemplate = Handlebars.compile todoItemTemplateSource
        
    $("#add-todo-item-button").click ->
        console.log 'add-todo-item-button clicked'
        content = todoItemTemplate { content: $('#add-todo-item-content').val() }
        $("#todo-list").append content

    $("#todo-list").on "click", ".todo-item", ->
        console.log 'todo-item clicked'
        $(this).toggleClass 'todo-item-done'