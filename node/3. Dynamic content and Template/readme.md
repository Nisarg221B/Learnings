## Templating Engines

### 1. Understanding Templating Engines

```mermaid
graph TD;
    A[HTMLish Template]--Node/Express -- Templating Engine-->B[Replaces Placeholders/ Snippets\n with HTML content];
    B-->D[HTML File];
```

#### Available Templating Engines

  - EJS ( Embedded Javascript Template)
    - eg: `<p><%= name %> </p>`
    - Use normal HTML and plain javascript in your templates

  - PUG (jade)
    - eg: `p #{name}`
    - Use minimal HTML and custom template languages

  - Handlebars
    - eg: `<p> {{ name }} </p>`
    - Use normal HTML and custom template language

### 2. Render Dynamic Content in our views

#### 2.1 registering/setting template engines

- To use the templating engines provided out of the box by express we use just app.set to set the configuration property "view engine" to the preffered engine.

  - <b>see EJS(2.3) and PUG(2.1) in server.js file</b>

- To use external template engines which are not supported by express out of the box eg: handlebar , <b>see the notes on handlebar(2.2) server.js file</b>

#### 2.2 Rendering the page

- Instead of just sending a file back as a response directly we would render the file using view engine which will send the final interpreted html file back as response.

- to do so we use res.render function
  - res.render(view [, locals] [, callback])
  - Renders a view and sends the rendered HTML string to the client. Optional
  parameters: 
    - The <b>view</b> argument is a string that is the file path of the view file to render. This can be an absolute path, or a path relative to the views setting. 
    
    - <b>locals</b>, an object whose properties define local variables for the view. 
    
    - <b>callback</b>, a callback function. If provided, the method returns both the possible error and rendered string, but does not perform an automated response. When an error occurs, the method invokes next(err) internally.

  - example:
  - send the rendered view to the client
    ```javascript 
    res.render('index')
    ```

  - if a callback is specified, the rendered HTML string has to be sent explicitly
    ```javascript      
    res.render('index', function (err, html) {
      res.send(html)
    })
    ```

  - pass a local variables to the view using object 
    <b>(see routes/admin.js file or routes/shop.js)</b>
    ```javascript
    res.render('user',
    { // passing the variables to the view 
      name: 'Tobi' , 
      title: 'usersPage'
    });
    ```

#### 2.3 Notes

- For all the templating engine the way how you render the page and send the local data/variable remains the same. all the local variables passed to the render function are directly available for use inside the view files.
- PUG and hbs_bar uses layout , ejs has a way around for lack of layouts through using includes.
- I personally prefere pug for its minial look and simpler use
  - PUG
  - <b>views/pug/layout/main-layout.pug</b>
      - The layout which pug uses has hooks called <b>block hookname</b> 
      - this hooks can be filled at other .pug files with their code by just mentioning the block name. <b> see views/pug/shop.pug </b>