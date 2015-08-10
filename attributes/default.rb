default['TRF']['version'] = '407b'
default['HMMER']['version'] = '3.1b2'
#################################################
# http://www.repeatmasker.org/RepeatMasker-open-4-0-5.tar.gz
default['RepeatMasker']['version'] = '4-0-5'
default['RepeatMasker']['filename'] = 'RepeatMasker-open-' + default['RepeatMasker']['version'] + '.tar.gz'
default['RepeatMasker']['url'] = 'http://www.repeatmasker.org/' + default['RepeatMasker']['filename']
default['RepeatMasker']['install_dir'] = '/usr/local'
default['RepeatMasker']['dir'] = default['RepeatMasker']['install_dir'] + '/RepeatMasker'
#################################################
# http://www.dfam.org/web_download/Current_Release/Dfam.hmm.gz
# http://www.dfam.org/web_download/Release/Dfam_1.4/Dfam.hmm.gz
default['RepeatMasker']['dfamFilename'] = 'Dfam.hmm.gz'
default['RepeatMasker']['dfamUrl'] = 'http://www.dfam.org/web_download/Current_Release/' + default['RepeatMasker']['dfamFilename']
# default['RepeatMasker']['dfamUrl'] = 'http://www.dfam.org/web_download/Release/Dfam_1.4/' + default['RepeatMasker']['filename']
