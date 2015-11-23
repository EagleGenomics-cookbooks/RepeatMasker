# RepeatMasker

Description
===========
This Cookbook installs RepeatMasker.

http://www.repeatmasker.org/

RepeatMasker is a program that screens DNA sequences for interspersed repeats and low complexity 
DNA sequences. The output of the program is a detailed annotation of the repeats that are present 
in the query sequence as well as a modified version of the query sequence in which all the 
annotated repeats have been masked (default: replaced by Ns). Currently over 56% of human genomic 
sequence is identified and masked by the program. Sequence comparisons in RepeatMasker are 
performed by one of several popular search engines including nhmmer (used in this cookbook), cross_match, ABBlast/WUBlast, 
RMBlast and Decypher. RepeatMasker makes use of curated libraries of repeats and currently supports 
Dfam ( profile HMM library derived from Repbase sequences ) and Repbase, a service of the 
Genetic Information Research Institute.

Requirements
============

## Platform:

* Centos 6.6

Notes
=====
This program uses the Dfam database. By default it downloads the lastest version but if you want to override that change the following:

default['RepeatMasker']['dfamUrl'] attribute, e.g. replace 

`default['RepeatMasker']['dfamUrl'] = 'http://www.dfam.org/web_download/Release/Current_Release' + default['RepeatMasker']['filename']`

with

`default['RepeatMasker']['dfamUrl'] = 'http://www.dfam.org/web_download/Release/Dfam_1.4/' + default['RepeatMasker']['filename']`

The cookbook also depends on the TRF and HMMER cookbooks so defines its preferred versions 

`default['TRF']['version'] = '407b'

default['HMMER']['version'] = '3.1b2'`

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[RepeatMasker]) or a cookbook (include_recipe 'RepeatMasker')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge default-centos65 

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65

Attributes
==========
See attributes/default.rb for default values.

default['RepeatMasker']['version']

License and Authors
===================

* Authors:: Bart Ailey  (<chef@eaglegenomics.com>)
* Authors:: Dan Barrell (<chef@eaglegenomics.com>)
* Authors:: Nick James  (<chef@eaglegenomics.com>)

Copyright:: 2015, Eagle Genomics Ltd
    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====
