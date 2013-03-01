Pod::Spec.new do |s|
  s.name         = "FLSKExpandingButton"
  s.version      = "0.0.1"
  s.summary      = "Expanding button."
  s.homepage     = "https://github.com/subdigital/BSModalPickerView"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Karlo Kristensen" => "karlo@floskel.com" }
  s.source       = { 
    :git => "https://github.com/floskel/FLSKButton.git", 
    :tag => "0.1"
  }

  s.source_files = '*.{h,m}'
  s.platform     = :ios, '6.0'
end