# Intro

This is an example meant for people familiar with jquery but new to  **jade** and **coffeescript**.
It's the typical (client-side) [SPA](https://en.wikipedia.org/wiki/Single-page_application) todo-list-example.

The coffeescript-rendering is done with a jade-filter (http://jade-lang.com/reference/filters/) and a jade-include (http://jade-lang.com/reference/includes/).

Comments welcome!



# Prereqs

The `jade` and `coffee-script` npm modules installed globally:

```
sudo npm install -g jade
sudo npm install -g coffee-script
```



# Instructions

Clone the repo. Go inside the directory.

Watch current directory and output prettily rendered html to current directory :

```
jade . -o . -w -P
```

Keep the rendered `todos.html` open in your browser. You will have to **manually** refresh.

Bootstrap, jQuery and handlebars are included via CDN links.



# How does it work?

It's really not that hard. Check the source :)

### Avoiding plain old HTML

The dynamic adding of `todo-item`'s is generally done by adding HTML as a string, like:

```CoffeeScript
content = "<div class='todo-item'>" + $('#add-todo-item-content').val() + "</div>"
$("#todo-list").append content
```

This starts to make the code look like a rather ugly hybrid of jade and html.

The better solution is to use templates. Since we need *client-side* templating, handelbars comes into play:

- jade renders the handlebars template:

```Jade
script#todo-item-template(type=text/x-handlebars-template)
    .todo-item {{content}}
```

- some coffeescript to compile the template:

```CoffeeScript
todoItemTemplateSource = $('#todo-item-template').html()
todoItemTemplate = Handlebars.compile todoItemTemplateSource
```

- some coffeescript to pass the user's content to the template and append it to the todo-list:

```CoffeeScript
content = todoItemTemplate { content: $('#add-todo-item-content').val() }
$("#todo-list").append content
```

Notice how we avoided pure html **and** have better maintainable code.

The disadvantage is that we have to include a complete template engine (handlebars) into the SPA.
This could be solved by precompiling the template but this probably requires something like Browserify.

> It should be possible to avoid handlebars and also use jade *client-side* with the jade API (http://jade-lang.com/api/)
> as in this example: http://jsfiddle.net/akazah/34BMe/.

