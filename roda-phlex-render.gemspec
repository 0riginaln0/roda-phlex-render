# roda-phlex-render.gemspec

Gem::Specification.new do |spec|
  spec.name        = "roda-phlex-render"
  spec.version     = "1.0.1"
  spec.authors     = ["Dmitriy Ryzhenko"]
  spec.summary     = "Return Phlex views directly from Roda route blocks"
  spec.description = "A Roda plugin for rendering Phlex::HTML block results."
  spec.homepage    = "https://github.com/0riginaln0/roda-phlex-render"
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 3.2"

  spec.files = Dir[
    "lib/**/*",
    "README.md",
    "LICENSE"
  ]

  spec.require_paths = ["lib"]

  spec.add_dependency "roda"
  spec.add_dependency "phlex"
end
