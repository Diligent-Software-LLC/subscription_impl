require_relative './lib/subscription_impl/version'

Gem::Specification.new do |spec|

  # Required attributes.
  spec.name                  = "subscription_impl"
  spec.version               = Subscription::VERSION
  spec.authors               = ["Diligent Software LLC"]
  spec.email                 = ["contact@diligentsoftware.org"]
  spec.summary               = %q{A Subscription library implementation.}
  spec.description           = %q{A Subscription library implementation.
Donations support continuous improvement and maintenance. The aim is a
reliable, integrable, and endurable Subscription library. Make a donation at
the project's collective page: https://opencollective.com/subscription.
One-time and recurring donations are available at $1, $2, $4, $8, and $16.
Custom donation configurations and anonymity also available. Greatly
appreciated.}
  spec.homepage              =
      "https://docs.diligentsoftware.org/subscription-1/implementation"
  spec.license               = "GPL-3.0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.5")

  # Metadata.
  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] =
      "https://github.com/Diligent-Software-LLC/subscription_impl"
  spec.metadata['changelog_uri']   =
      "https://docs.diligentsoftware.org/subscription-1/" +
          "packages#implementation_changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been 
  # added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f|
      f.match(%r{^(test|spec|features)/})
    }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Development and testing dependencies.
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'simplecov', '~> 0'
  spec.add_development_dependency 'node', '~> 4'
  spec.add_development_dependency 'node_diagram', '~> 0'
  spec.add_development_dependency 'diagram_factory_int', '~> 1'
  spec.add_development_dependency 'diagram_factory_impl', '~> 0'
  spec.add_development_dependency 'subscription_int', '~> 0'
    # spec.add_development_dependency 'node_subscription_impl', '~> 0'

end
