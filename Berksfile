source 'https://supermarket.chef.io'

def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, { git: "git@github.com:EagleGenomics-cookbooks/#{name}.git" }.merge(options))
end

company_cookbook 'HMMER', '= 1.0.1', tag: '1.0.1'
company_cookbook 'TRF'

cookbook 'magic_shell', '~> 1.0.0'

metadata
