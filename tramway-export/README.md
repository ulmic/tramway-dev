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

#### 4. Create decorator that describes, how your model should be exported. You need to create exactly decorator name `app/decorators/#{your_model_name}_xlsx_decorator.rb`


*app/decorators/your_model_xlsx_decorator.rb*

```ruby
class YourModelXlsxDecorator < Tramway::Export::Xlsx::ApplicationDecorator
  class << self
    def columns
      %i[column1 column2 column3] # here array of strings or symbols with columns names. It'll be used as headers in Excel file 
    end
    
    def filename
      `your_file_name.xlsx`
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

#### 5. Restart your server and visit index page of models in your admin panel


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
