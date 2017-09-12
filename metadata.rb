name 'achievemore-cookbook'
maintainer 'Thiago da Anunciação'
maintainer_email 'thiago.anunciacao@achievemore.com.br'
license 'all_rights'
description 'Installs/Configures achievemore-cookbook'
long_description 'Installs/Configures achievemore-cookbook'
version '0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/achievemore-cookbook/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/achievemore-cookbook' if respond_to?(:source_url)

depends 'opsworks_ruby', '1.7.0'
depends 'packages', '~> 1.0.0'
