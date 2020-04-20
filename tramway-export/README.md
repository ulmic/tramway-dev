# Tramway::Export

Plugin for tramway-admin gem. Provides exporting collections to Excel files.

## Installation & Usage

#### 1. Add this line to your application's Gemfile:

```ruby
gem 'tramway-admin'
gem 'tramway-export'
```

##### 2. And then execute:
```bash
$ bundle
```

#### 3. Add exportable models to tramway initializer

*config/initializers/tramway.rb*

```ruby
Tramway::Export.set_exportable_models YourModel, project: :your_project_name
```

#### 4. Create decorator that describes, how your model should be exported. You need to create exactly decorator name `app/decorators/#{your_model_name}_xls_decorator.rb`

**If you have constant list of columns just use `columns` method this way**

*app/decorators/your_model_xls_decorator.rb*

```ruby
class YourModelXlsDecorator < Tramway::Export::Xls::ApplicationDecorator
  class << self
    def columns
      %i[column1 column2 column3] # here array of strings or symbols with columns names. It'll be used as headers in Excel file 
    end
    
    def filename
      `your_file_name.xls`
    end
  end
  
  def column1
    # getting value
  end
  
  def column2
    # getting value
  end
  
  def column3
    # getting value
  end
end
```
**If you don't have constant list of columns, use `flexible_columns` this way**

Just imagine: our model contains method `values` and we want to have columns according to `values` keys. You shouldn't create methods for every column. Just use `Proc`. It's provided by gem `xls_exporter`. You can read more about [here](https://github.com/kalashnikovisme/xls-exporter).

*app/decorators/your_model_xls_decorator.rb*
```ruby
class YourModelXlsDecorator < Tramway::Export::Xls::ApplicationDecorator
  def flexible_columns
    object.values.keys.map do |key|
      { key.to_sym => -> { object.values.dig(key) } }
    end
  end
end
```

#### 5. Restart your server and visit index page of models in your admin panel

### User instructions

English coming soon

[На русском](https://github.com/ulmic/tramway-dev/blob/develop/tramway-export/docs/russian/README.md)

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
