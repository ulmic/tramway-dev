### Documentation for frontend

## Sign Up

Signing Up is creation of user (of another model, which is user)

Create user

*POST* `/api/v1/records?model=User`

Params structure

```
{
  data: {
    attributes: {
      # all your attributes in key-value format. Attribute name must be in kebab case
    }
  }
}
```

## Sign In

*POST* `/api/v1/user_token`

Params structure:

```json
{
  email (or another attribute you use to login):
  password:
}
```

## Create record

*POST
