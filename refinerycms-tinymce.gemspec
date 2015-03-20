# Encoding: UTF-8
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-tinymce}
  s.version           = '0.0.1'
  s.description       = %q{Support tinymce 4 in refinerycms}
  s.summary           = %q{Support tinymce 4 in refinerycms}
  s.email             = %q{wuboys@gmail.com}
  s.homepage          = %q{http://www.makeanegg.com}
  s.authors           = ['Ernest Wu']
  s.license           = 'MIT'
  s.require_paths     = %w(lib)

  s.files             = `git ls-files -- lib/*`.split("\n")
  s.require_paths     = %w(lib)

  s.add_dependency 'refinerycms-core'
  s.add_dependency 'tinymce-rails'
  s.add_dependency 'deface'
end
