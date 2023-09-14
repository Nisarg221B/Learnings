#### Managing Data (Without a Database)

#### Render Dynamic Content in our views

#### Understanding Templating Engines

```mermaid
graph TD;
    A[HTMLish Template]--Node/Express -- Templating Engine-->B[Replaces Placeholders/ Snippets\n with HTML content];
    B-->D[HTML File];
```

- Available Templating Engines
  - EJS
    - eg: `<p><%= name %> </p>`
    - Use normal HTML and plain javascript in your templates
  - PUG (jade)
    - eg: `p #{name}`
    - Use minimal HTML and custom template languages
  - Handlebars
    - eg: `<p> {{ name }} </p>`
    - Use normal HTML and custom template language
