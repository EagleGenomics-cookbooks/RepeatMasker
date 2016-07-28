name 'RepeatMasker'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures RepeatMasker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

source_url 'https://github.com/EagleGenomics-cookbooks/RepeatMasker'
issues_url 'https://github.com/EagleGenomics-cookbooks/RepeatMasker/issues'

depends 'build-essential'
depends 'magic_shell'
depends 'HMMER'
depends 'TRF'
