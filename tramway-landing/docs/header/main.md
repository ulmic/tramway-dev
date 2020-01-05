### Header

#### Code Example

*app/views/web/welcome/index.html.haml*

```haml
= content_for :application_name do
  = "This is `application_name` content"

= content_for :application_tagline do
  = "This is `application_tagline` content"
```

#### Result

![header-example](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/example.png)
