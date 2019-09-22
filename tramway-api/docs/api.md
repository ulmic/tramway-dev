### Documentation for frontend

## Sign Up

Signing Up is creation of user (of another model, which is user)

Create user

**POST** `/api/v1/records?model=User`

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

**POST** `/api/v1/user_token`

Params structure:

```
{
  email (or another attribute you use to login):
  password:
}
```

## Create record

**POST** `/api/v1/records?model=#{model_you_want_to_create}`

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

## Show record

**GET** `/api/v1/records/#{public_id_of_model}?model=#{model_you_want}`

## Show collection

**GET** `/api/v1/records?model=#{mode_you_want}&scope=#{preconfigurated_scopes_on_backend}&search=#{search_value_on_preconfigurated_attributes_on_backend}`

## Update record

**PATCH** `/api/v1/records/#{public_id_of_model}?model=#{model_you_want}`

Params structure

```
{
  data: {
    attributes: {
      # all your attributes in key-value format you want to change. Attribute name must be in kebab case
    }
  }
}
```

## Delete record (Tramway provide soft-deleting)

**DELETE** `/api/v1/records/#{public_id_of_model}?model=#{model_you_want}`
